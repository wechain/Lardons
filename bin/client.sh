#!/usr/bin/env sh

if [ -d client/node_modules ]
then
    echo "Client already present. Skipping bootstrapping phase."
else
    echo "Client not present. Starting bootstrapping phase."
    expect bin/vue-cli.exp
    cd client && npm i && cd ..
fi

cd client
pm2-runtime start npm --name "client" -- run dev