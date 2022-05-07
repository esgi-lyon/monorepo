import { ClientMetadata, JWKS } from "oidc-provider";
import jwks from "../jwks"
import { genCookies } from "../utils/cookie.utils";

export type AdditionalOIDCConfig = {
  jwks: JWKS,
  clients: ClientMetadata[],
  cookies: { keys: string[] }
}

export const getOidcClientsConfig = (): { oidcConfig: AdditionalOIDCConfig } => {
  const { OIDC_CLIENTS, OIDC_COOKIE_NB } = process.env
  return {
    oidcConfig: {
      clients: JSON.parse(OIDC_CLIENTS) ?? [],
      jwks,
      cookies: { keys: genCookies(Number(OIDC_COOKIE_NB) ?? 1) }
    }
  }
}
