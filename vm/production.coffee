module.exports =
  keepResponseErrors: true
  admin: [
    'admin@abc.com'
  ]
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
    scope: [
      'User'
    ]
  vagrant:
    disk: # GB
      min: 20
      max: 80
    memory: # GB
      min: 2
      max: 4
    port:
      vnc: 5900
      http: 8000
    box: 'debian/jessie64'
  vm:
    url: 'https://abc.com/vm/api/vm'
  webhook:
    url: 'http://vncproxy.service.triangle:1337/reload'
    oauth2: 
      grant_type: 'client_credentials'
      client:
        id: 'client_credentials'
        secret: 'client_secret'
