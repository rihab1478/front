FROM node:latest-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY .. .
RUN npm run build

FROM nginx:alpine
COPY --from=build-stage /app/dist/frontend /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
