fs = require 'fs'

module.exports =
  admin: process.env.ADMIN?.split(',') || [
    'admin@abc.com'
  ]
  oauth2:
    url:
      authorize: process.env.AUTHURL || 'https://mobtest.ml/jsoauth2/oauth2/authorize/'
      verify: process.env.VERIFYURL || 'https://mobtest.ml/jsoauth2/oauth2/verify/'
      token: 'https://abc.com/auth/oauth2/token/'
    client:
      id: process.env.CLIENT_ID || 'client_id'
      secret: 'client_secret'
    user:
      id: 'user_id'
      secret: 'user_secret'
  ssl:
    key: fs.readFileSync('config/env/ssl/ttsoon.ml.key', 'utf8').toString()
    cert: fs.readFileSync('config/env/ssl/ttsoon.ml.crt', 'utf8').toString()
