import _ from "lodash";

export const filterUndefinedInObj = (obj: object) =>
  _.omit(obj, _.filter(_.keys(obj), function(key) { return obj[key] == null }))

export const toSnakeCase = (obj: object) => {
  return Object.entries(JSON.parse(JSON.stringify(obj))).map(([k, v]) => {
    return [_.snakeCase(k), v]
  }).reduce((acc, [k, v]) => ({ ...acc, [k]: v}), {})
}
