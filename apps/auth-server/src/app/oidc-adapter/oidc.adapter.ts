
import { Adapter } from 'oidc-provider';
import { MixedCacheDbStorageService } from "./mixed-cache-db-storage.service";
import {ModuleRef} from "@nestjs/core";

export class OidcAdapter extends MixedCacheDbStorageService implements Adapter {

  constructor(model: string, ref: ModuleRef) {
    super()
    this.init({ model, ref })
  }
}
