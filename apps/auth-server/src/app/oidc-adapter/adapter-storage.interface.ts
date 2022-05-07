import { Adapter } from 'oidc-provider';

export interface AdapterStorageInterface extends Adapter {
  init(modelAccess: any)
}
