FROM node

RUN apt-get update && apt-get install sudo expect -y
RUN adduser node sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir /usr/app/
RUN chown -R node:www-data /usr/app/
RUN chmod -R g+w /usr/app/

RUN npm i -g strapi@alpha
RUN npm i -g pm2

EXPOSE 1337
CMD sudo chmod +x /usr/app/entrypoint.sh && sudo chown node:www-data /usr/app/entrypoint.sh && sh /usr/app/entrypoint.sh