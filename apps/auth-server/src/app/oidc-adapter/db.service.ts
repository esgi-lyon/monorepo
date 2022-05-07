import { Injectable } from '@nestjs/common';
import LRU from 'lru-cache';
import { AdapterPayload } from "oidc-provider";

@Injectable()
export class DatabaseService {

  private readonly storage = new LRU({ max: 1000 });
  private readonly grantable = new Set([
    'AccessToken',
    'AuthorizationCode',
    'RefreshToken',
    'DeviceCode',
    'BackchannelAuthenticationRequest',
  ]);

  private static key(model: string, id: string) {
    return `${model}:${id}`;
  }

  private static grantKeyFor(id: string) {
    return `grant:${id}`;
  }

  private static sessionUidKeyFor(id: string) {
    return `sessionUid:${id}`;
  }

  private static userCodeKeyFor(userCode: string) {
    return `userCode:${userCode}`;
  }

  upsert(
    model: string,
    id: string,
    payload: Record<string, any>,
    expiresIn: number,
  ) {
    const key = DatabaseService.key(model, id);
    const { grantId, userCode, uid } = payload;

    if (model === 'Session') {
      this.storage.set(DatabaseService.sessionUidKeyFor(uid), id, { ttl: expiresIn * 1000 });
    }

    if (this.grantable.has(model) && grantId) {
      const grantKey = DatabaseService.grantKeyFor(grantId);
      const grant = this.storage.get(grantKey) as string[];

      if (!grant) {
        this.storage.set(grantKey, [key]);
      } else {
        grant.push(key);
      }
    }

    if (userCode) {
      this.storage.set(DatabaseService.userCodeKeyFor(userCode), id, { ttl: expiresIn * 1000 });
    }

    this.storage.set(key, payload, { ttl: expiresIn * 1000 });
  }

  delete(model: string, id: string) {
    const key = DatabaseService.key(model, id);
    this.storage.delete(key);
  }

  consume(model: string, id: string) {
    (this.storage.get(DatabaseService.key(model, id)) as any).consumed = true;
  }

  find(model: string, id: string): void | AdapterPayload {
    return this.storage.get(DatabaseService.key(model, id));
  }

  findByUid(model: string, uid: string) {
    const id = this.storage.get(DatabaseService.sessionUidKeyFor(uid)) as string;
    return this.find(model, id);
  }

  findByUserCode(model: string, userCode: string) {
    const id = this.storage.get(DatabaseService.userCodeKeyFor(userCode)) as string;
    return this.find(model, id);
  }

  revokeByGrantId(grantId: string) {
    const grantKey = DatabaseService.grantKeyFor(grantId);
    const grant = this.storage.get(grantKey) as any[];
    if (grant) {
      grant.forEach((token) => this.storage.delete(token));
      this.storage.delete(grantKey);
    }
  }
}
