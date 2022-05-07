import { times, random } from "lodash"

export const getRandomString = () =>
  times(20, () => random(35).toString(36)).join('');
