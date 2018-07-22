# 🥓 Lardons
**[strapi, mongo, nuxt, docker-compose]**
_"full stack framework"_ for the modern times

**This is absolutely not safe in any manner for production. Use only for local dev.**

## Instructions
0. (**requirement**) **docker-compose** installed
1. configure the `.env` variables
2. run `yarn start` or `npm start`
3. (_optional_) if you just cloned the repo, everything (strapi + mongo + nuxt) will be generated the first time you start the app, this takes a little time, check the progress out using `yarn logs`

## Scripts
```bash
# YARN = NPM RUN

# all of these run OUTSIDE the CONTAINER
###################################################################
yarn start                          # docker-compose up -d
yarn logs                           # docker-compose logs -f
yarn shell                          # docker-compose exec node sh
yarn stop                           # docker-compose down

# all of these run INSIDE the CONTAINER
###################################################################
yarn client:add bootstrap@4.1.1     # npm install bootstrap
yarn client:restart                 # pm2 restart client
yarn client:logs                    # pm2 logs client
###################################################################
yarn server:strapi <command>        # strapi <command>
yarn server:add graphql             # strapi install graphql
yarn server:restart                 # pm2 restart server
yarn server:logs                    # pm2 logs server
```

## How it works
1. dockerfile builds an image that has node, strapi, nuxt and pm2
2. this image has an entrypoint that checks if strapi or nuxt boilerplates are present
    1. if not, it installs them and automatically generates the boilerplates
    2. if yes, starts pm2 processes on the node container for client and server
3. this image is used on docker-compose with a mongo instance for the server

_(alot of behind the scenes magic is going on to have the correct permissions for linux development, your user needs to be in the docker group and you're set)_
