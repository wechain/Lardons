#!/usr/bin/env sh

if [ -d server/node_modules ]
then
    echo "Server already present. Skipping bootstrapping phase."
else
    echo "Server not present. Starting bootstrapping phase."
    expect bin/strapi.exp
fi

cd server
pm2-runtime start npm --name "server" -- run strapi -- start