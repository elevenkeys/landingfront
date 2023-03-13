FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM socialengine/nginx-spa:latest
COPY --from=node /app/dist/elevenkeys /app
RUN chmod -R 777 /app