FROM node:14 as build
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d
COPY --from=build /app/dist/crudtuto-Front /usr/share/nginx/html
EXPOSE 80
