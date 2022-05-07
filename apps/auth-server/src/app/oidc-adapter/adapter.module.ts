import { Module } from '@nestjs/common';
import { MixedCacheDbStorageService } from "./mixed-cache-db-storage.service";
import oidcRepos from '../oidc/oidc.model'

@Module({
    providers: [MixedCacheDbStorageService, ...oidcRepos],
    exports: [MixedCacheDbStorageService]
})
export class OidcAdapterModule {}
