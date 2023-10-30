FROM node:20.9.0-alpine as build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN ng build --prod

FROM nginx:stable

COPY --from=build /app/crudtuto-front/ /usr/share/nginx/html

EXPOSE 80
