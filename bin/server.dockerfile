FROM alpine
WORKDIR /app
RUN apk add --update nodejs npm expect git
RUN npm i -g strapi@alpha
RUN npm i -g pm2
EXPOSE 1337
ENTRYPOINT ./entrypoint.sh