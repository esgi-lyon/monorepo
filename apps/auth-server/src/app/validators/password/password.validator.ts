import { registerDecorator, ValidationOptions } from 'class-validator';
import { zxcvbn, zxcvbnOptions } from '@zxcvbn-ts/core'
import { ZxcvbnResult } from "@zxcvbn-ts/core/dist/types";
import zxcvbnCommonPackage from '@zxcvbn-ts/language-common'
import zxcvbnEnPackage from '@zxcvbn-ts/language-en'
import { Options } from '@zxcvbn-ts/core/dist/Options'

export const options: Partial<Options> = {
  dictionary: {
    ...zxcvbnCommonPackage.dictionary,
    ...zxcvbnEnPackage.dictionary,
  },
  graphs: zxcvbnCommonPackage.adjacencyGraphs,
  translations: zxcvbnEnPackage.translations,
}

export function IsPasswordValid(
  isPasswordValidOptions: { strength: number } & Partial<Options> = { strength: 0 },
  validationOptions?: ValidationOptions
) {
  const { strength } = isPasswordValidOptions
  zxcvbnOptions.setOptions({ ...options, ...isPasswordValidOptions })

  return function (object: any, propertyName: string) {
    registerDecorator({
      target: object.constructor,
      propertyName: propertyName,
      constraints: [],
      options: validationOptions,
      validator: {
        validate(value: string) {
          if (value == null) {
            return false
          }

          const result: ZxcvbnResult = zxcvbn(value);

          if (result.score <= strength) {
            this.error = `Password is too weak: ${result.feedback.suggestions}`;
            return false;
          }

          return true;
        },
        defaultMessage(): string {
          return this.error || 'Something went wrong during password validation';
        }
      },
    });
  };
}
