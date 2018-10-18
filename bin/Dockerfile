FROM node:10-alpine

# add capacity to run command as sudo and add user to docker group (for linux dev)
RUN apk add --update sudo shadow
RUN adduser -D docker; \
    addgroup docker; \
    usermod -aG docker docker; \
    echo "docker ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/docker; \
    chmod 0440 /etc/sudoers.d/docker

WORKDIR /home/docker
USER docker

RUN sudo apk add --update expect git

RUN mkdir -p client
RUN mkdir -p server

RUN sudo npm config set unsafe-perm true

RUN sudo npm install -g vue-cli pm2 strapi@alpha

RUN sudo chown -R docker:docker . ;\
    sudo chgrp -R docker . ; \
    find . -type d | sudo xargs chmod g+w

ENTRYPOINT ./bin/entrypoint.sh
