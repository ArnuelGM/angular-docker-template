FROM node:lts-buster as build
WORKDIR /build
COPY . .
RUN npm install -g @angular/cli && npm install && ng build --prod

FROM php:7.4-apache-buster
COPY --from=build /build/dist/angular-template-docker .
