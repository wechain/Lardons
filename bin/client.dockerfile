FROM alpine
WORKDIR /app
RUN apk add --update nodejs npm expect git
RUN npm i -g vue-cli
RUN npm i -g pm2
EXPOSE 3000
ENTRYPOINT ./entrypoint.sh