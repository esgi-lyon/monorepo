export function AutoImplement<T>(): new () => T {
  return class { } as any;
}
