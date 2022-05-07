import { getRandomString } from "./id.utils";
import { Logger } from "@nestjs/common";

const COOKIE_ROTATE_DEFAULT = 1

export const genSingleCookie = (key = getRandomString(), logger: Logger = null) => {
  if (logger != null) logger.log(`Cookie key: ${key}`)
  return key
}

export const genCookies = (nb: number = COOKIE_ROTATE_DEFAULT) =>
  [...Array(nb).keys()].map(_ => genSingleCookie())
