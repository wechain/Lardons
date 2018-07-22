# 🥓 Lardons
**[strapi, mongo, nuxt, docker-compose]**

_"full stack framework"_ for the modern times

**This is absolutely not safe in any manner for production. Use only for local dev.**

## Instructions
0. (**requirement**) **docker-compose** installed
1. configure the `.env` variables
2. run `yarn start` or `npm start`
3. (_optionnal_) if you just cloned the repo, everything (strapi + mongo + nuxt) will be generated the first time you start the app, this takes a little time, check the progress out using `yarn logs`

## Scripts
```bash
# yarn = npm run

yarn start
yarn logs
yarn stop

yarn client:add bootstrap@4.1.1 # npm install
yarn client:restart
yarn client:start
yarn client:stop
yarn client:shell
yarn client:logs

yarn server:add graphql # strapi install
yarn server:restart
yarn server:start
yarn server:stop
yarn server:shell
yarn server:logs
```

## How it works
placeholder

## Future improvements
add STAGE env var and set entrypoint commands accordingly for dev, prod and staging 

for dev we need nuxt with watch

for prod build 

etc.