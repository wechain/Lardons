#!/usr/bin/env sh

if [ -d client/node_modules ]
then
    echo "Client already present. Skipping bootstrapping phase."
else
    echo "Client not present. Starting bootstrapping phase."
    expect bin/vue-cli.exp
    cd client && npm i && cd ..
fi

if [ -d server/node_modules ]
then
    echo "Server already present. Skipping bootstrapping phase."
else
    echo "Server not present. Starting bootstrapping phase."
    expect bin/strapi.exp
fi

pm2-runtime ecosystem.config.js
