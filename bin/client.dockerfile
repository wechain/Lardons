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

COPY client.sh bin/client.sh
COPY vue-cli.exp bin/vue-cli.exp

RUN sudo apk add --update nodejs npm expect git

RUN mkdir -p client

RUN sudo npm i -g vue-cli
RUN sudo npm i -g pm2

RUN sudo chown -R default:docker . ;\
    sudo chgrp -R docker . ; \
    find . -type d | sudo xargs chmod g+w

EXPOSE 3000
ENTRYPOINT ./bin/client.sh