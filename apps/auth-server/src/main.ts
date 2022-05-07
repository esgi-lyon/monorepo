import {Logger, ValidationPipe} from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app/app.module';
import { setupSwagger } from './app/swagger';
import { join } from 'path'
import { urlencoded} from "express";
import { NestExpressApplication } from "@nestjs/platform-express";
import { ConfigService } from "@nestjs/config";

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule, { bodyParser: true });
  setupSwagger(app);
  const globalPrefix = '';
  app.setGlobalPrefix(globalPrefix);
  app.useGlobalPipes(new ValidationPipe({
    transform: false
  }));
  app.setBaseViewsDir(join(__dirname, 'views'));
  app.setViewEngine('ejs');
  app.enable('trust proxy');

  app.use('/interaction', urlencoded({ extended: false }));

  const config = app.get(ConfigService);
  const [ hostname, port ] = [config.get("hostname"), config.get("port")]

  await app.listen(port, hostname);
  Logger.log(
    `Application is running on: http://${hostname}:${port}/${globalPrefix}`
  );
}

bootstrap();
