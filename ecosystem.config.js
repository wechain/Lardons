module.exports = {
    apps: [{
        name: 'server',
        cwd: "./server",
        script: 'npm',
        args: "run strapi -- start",
        env: {
            NODE_ENV: 'development'
        },
        env_production: {
            NODE_ENV: 'production'
        }
    }, {
        name: 'client',
        cwd: "./client",
        script: 'npm',
        args: "run dev",
        env: {
            NODE_ENV: 'development',
            HOST: '0.0.0.0'
        },
        env_production: {
            NODE_ENV: 'production'
        }
    }],

};
