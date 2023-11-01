FROM node:14-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY .. .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/crudtuto-front/ /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
