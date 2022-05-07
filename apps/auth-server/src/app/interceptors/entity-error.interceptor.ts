import {
  Injectable,
  NestInterceptor,
  ExecutionContext,
  CallHandler, UnprocessableEntityException, Logger,
} from '@nestjs/common';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { BaseError } from "sequelize";

@Injectable()
export class EntityErrorInterceptor implements NestInterceptor {
  private readonly logger = new Logger(EntityErrorInterceptor.name);

  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    return next
      .handle()
      .pipe(
        catchError(err => {
          if (!(err instanceof BaseError)) return throwError(() => err)

          this.logger.error(err)
          return throwError(() =>
            new UnprocessableEntityException(`Failed operation: ${err.message}`))
        }),
      );
  }
}
