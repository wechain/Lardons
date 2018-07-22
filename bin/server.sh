#!/usr/bin/env bash

if [ -d /src/app/server ]
then
    echo "Server not present. Starting bootstrapping phase."
    npm i -g vue-cli
    cd /src/app
    printf "\n\n\n" | vue init nuxt-community/starter-template client
    cd client
    npm i
else
    echo "Server already present. Skipping bootstrapping phase."
fi

su - 1000