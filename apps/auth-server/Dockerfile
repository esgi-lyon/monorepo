FROM node:lts-alpine
WORKDIR /app
COPY dist/apps/auth-server .
ENV PORT=3333
EXPOSE ${PORT}
RUN npm install --production
# dependencies needed
RUN npm install reflect-metadata tslib rxjs @nestjs/platform-express pg @zxcvbn-ts/language-en
CMD node ./main.js
