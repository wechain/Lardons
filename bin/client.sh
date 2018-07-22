#!/usr/bin/env bash

cd /usr/app/client
if [ -d /usr/app/client/node_modules ]
then
    echo "Client already present. Skipping bootstrapping phase."
else
    echo "Client not present. Starting bootstrapping phase."
    sudo chown -R node:www-data /usr/app
    sudo chmod -R g+w /usr/app
    sudo chmod +x /usr/app/vue-cli.exp
    sudo chown node:www-data /usr/app/vue-cli.exp
    /usr/app/vue-cli.exp
    npm i
    sudo chown -R node:www-data /usr/app/client
    sudo chmod -R g+w /usr/app/client
fi

npm run dev