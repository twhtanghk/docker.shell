module.exports =
  admin: [
    'admin@abc.com'
  ]
  connections:
    mongo:
      url: 'mongodb://@mongo:27017/proxy'
  oauth2:
    url:
      authorize: 'https://abc.com/auth/oauth2/authorize/'
      verify: 'https://abc.com/auth/oauth2/verify/'
      token: 'https://abc.com/auth/oauth2/token/'
    client:
      id: 'client_id'
      secret: 'client_secret'
    user:
      id: 'user_id'
      secret: 'user_secret'
