import { Injectable, Logger } from '@nestjs/common';
import LRU from 'lru-cache';
import { AdapterPayload, ClientMetadata} from "oidc-provider";
import { AdapterStorageInterface } from "./adapter-storage.interface";
import { Client, Grant } from "../oidc/oidc.model";
import { ModuleRef } from "@nestjs/core";
import { getRepoKey } from "../utils/db.utils";

type PersistedAdapterData = typeof Client | typeof Grant

const PERSISTED_ADAPTER_DATA_NAMES = [
  Client.name,
  Grant.name
]

/**
 * TODO implement a chain of responsibility pattern to choose storage
 * TODO implement error filter to handle custom exceptions (and log) in nest
 * TODO add redis and mongo
 * TODO can choose storage depending on configuration for grant, client, or any other oidc entities
 */
@Injectable()
export class MixedCacheDbStorageService implements AdapterStorageInterface {

  private model: string
  private moduleRef: ModuleRef

  private readonly logger = new Logger(MixedCacheDbStorageService.name);

  private readonly storage = new LRU({ max: 1000 });
  private readonly grantable = new Set([
    'AccessToken',
    'AuthorizationCode',
    'RefreshToken',
    'DeviceCode',
    'BackchannelAuthenticationRequest',
  ]);

  public init({ ref, model }: { ref: ModuleRef, model: string }) {
    this.model = model
    this.moduleRef = ref
  }

  async upsert(
    id: string,
    data: AdapterPayload | ClientMetadata,
    expiresIn: number,
  ) {
    const key = MixedCacheDbStorageService.key(this.model, id);
    const { grantId, userCode, uid } = data as AdapterPayload;
    this.logger.debug(`New payload ${key} - has session : ${uid||"none"}`)

    if (this.model === 'Session') {
      this.storage.set(MixedCacheDbStorageService.sessionUidKeyFor(uid), id, { ttl: expiresIn * 1000 });
    }

    try {

      if (this.grantable.has(this.model) && grantId) {
        await this.upsertGrantable({ id, grantId, data })
      }

      if (this.model === Client.name) {
        const metas = data as ClientMetadata
        await this.createClient({id, data: metas})
      }
    } catch (e) {
      this.logger.error(e)
    }

    if (userCode) {
      this.storage.set(MixedCacheDbStorageService.userCodeKeyFor(userCode), id, { ttl: expiresIn * 1000 });
    }

    this.storage.set(key, data, { ttl: expiresIn * 1000 });
  }

  async destroy(id: string) {
    const key = MixedCacheDbStorageService.key(this.model, id);
    this.storage.delete(key);
  }

  async consume(id: string) {
    await this.updatePersistedAdapterData(id, { consumed: true });
    (this.storage.get(MixedCacheDbStorageService.key(this.model, id)) as any).consumed = true;
  }

  async find(id: string): Promise<AdapterPayload | ClientMetadata> {
    return (await this.findPersistedAdapterData(id)) ||
      this.storage.get(MixedCacheDbStorageService.key(this.model, id));
  }

  /**
   * For session
   * @param uid session uid
   */
  findByUid(uid: string) {
    this.logger.debug(`Using session ${uid}`)
    const id = this.storage.get(MixedCacheDbStorageService.sessionUidKeyFor(uid)) as string;
    return this.find(id);
  }

  /**
   * For device flow
   * @param userCode device code
   */
  findByUserCode(userCode: string) {
    const id = this.storage.get(MixedCacheDbStorageService.userCodeKeyFor(userCode)) as string;
    return this.find(id);
  }

  async revokeByGrantId(grantId: string) {
    const grantRepo = this.getRepo<typeof Grant>()

    let grant
    try {
      grant = await grantRepo.findOne({ where: { grantId }, raw: true})
    } catch (e) {
      this.logger.error(e)
    }

    if (grant) {
      grant.data.forEach(token => this.storage.delete(token));
    }

    await grantRepo.destroy({ where: { grantId } })
  }

  private static key(model: string, id: string) {
    return `${model}:${id}`;
  }

  private static sessionUidKeyFor(id: string) {
    return `sessionUid:${id}`;
  }

  private static userCodeKeyFor(userCode: string) {
    return `userCode:${userCode}`;
  }

  protected async updatePersistedAdapterData(
    id: string,
    data: Partial<AdapterPayload>
  ) {
    if (!this.isPersistedModel()) return

    try {
      await this
        .getRepo<PersistedAdapterData>()
        .update(data, this.getWhereOption(id))
    } catch (e) {
      this.logger.error(e)
    }
  }

  protected async findPersistedAdapterData(id: string): Promise<AdapterPayload | ClientMetadata | null> {
    if (!this.isPersistedModel()) return undefined

    try {
      const res = (await this
        .getRepo<PersistedAdapterData>()
        .findOne(this.getWhereOption(id))).data

      return this.model !== Client.name
        ? res as AdapterPayload
        : res as ClientMetadata
    } catch (e) {
      this.logger.error(e)
      return null
    }
  }

  protected getWhereOption(id) {
    return {
      where: {id},
      raw: true
    }
  }

  protected isPersistedModel() {
    return this.model in PERSISTED_ADAPTER_DATA_NAMES || this.grantable.has(this.model)
  }

  protected async upsertGrantable({ grantId, id, data }) {
    const grantRepo = this.getRepo<typeof Grant>()

    try {
        await grantRepo.upsert({
          id,
          grantId,
          data
        })
    } catch (e) {
      this.logger.error(e)
    }
  }

  protected async createClient({ id, data }: { id: string, data: ClientMetadata}) {
    const repo = this.getRepo<typeof Client>()
    try {
      await repo.upsert({
        id,
        data,
        consumed: false
      })
    } catch (e) {
      this.logger.error(e)
    }
  }

  protected getRepo<T>(): T {
    if (this.model !== Grant.name && this.grantable.has(this.model)) {
      return this.moduleRef.get(getRepoKey(Grant.name))
    }

    return this.moduleRef.get(getRepoKey(this.model))
  }

}
