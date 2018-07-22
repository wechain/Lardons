#!/usr/bin/env bash

cd /usr/app
if [ -d /usr/app/server/node_modules ]
then
    echo "Server already present. Skipping bootstrapping phase."
    cd server
else
    echo "Server not present. Starting bootstrapping phase."
    sudo chown -R node:www-data /usr/app
    sudo chmod -R g+w /usr/app
    sudo chmod +x /usr/app/strapi.exp
    sudo chown node:www-data /usr/app/strapi.exp
    /usr/app/strapi.exp
    sudo chown -R node:www-data /usr/app/server
    sudo chmod -R g+w /usr/app/server
    cd server
fi


pm2-runtime start npm --name "server" -- run strapi start