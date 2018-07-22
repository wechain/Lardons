FROM alpine

# add capacity to run command as sudo and add user to docker group (for linux dev)
RUN apk add --update sudo shadow
RUN adduser -D default; \
    addgroup docker; \
    usermod -aG docker default; \
    echo "default ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/default; \
    chmod 0440 /etc/sudoers.d/default

WORKDIR /home/default
USER default:docker

RUN sudo apk add --update nodejs npm expect git

RUN mkdir -p client
RUN mkdir -p server

RUN sudo npm i -g vue-cli pm2 strapi@alpha

RUN sudo chown -R default:docker . ;\
    sudo chgrp -R docker . ; \
    find . -type d | sudo xargs chmod g+w

ENTRYPOINT ./bin/entrypoint.sh