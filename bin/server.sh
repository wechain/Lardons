#!/usr/bin/env sh

if [ -d server/node_modules ]
then
    echo "Server already present. Skipping bootstrapping phase."
else
    echo "Server not present. Starting bootstrapping phase."
    expect strapi.exp
fi

chown -R 1000:root .
chmod g+w .
cd server
pm2-runtime start npm --name "server" -- run strapi -- start