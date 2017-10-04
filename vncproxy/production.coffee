module.exports =
  oauth2:
    url: # oauth2 server url to verify and acquire token
      verify: 'https://abc.com/auth/oauth2/verify/'
      token: 'https://abc.com/auth/oauth2/token/'
    client: # oauth2 client for resource owner password credentials grant
      id: 'client_id'
      secret: 'client_secret'
    user: # oauth2 user with amdinistrator right to read vm and update proxy
      id: 'user_id'
      secret: 'user_secret'
    scope: [
      'User'
    ]
  vm: # url for vm api and host to connect defined vm
    url: 'https://abc.com/api/vm'
    host: 'vagrantvm.service.consul'
  proxy: # url for proxy api
    url: 'https://abc.com/proxy/upstream'
  docker: # url for docker engine to create novnc container
    url: 'http://192.168.121.1:2375'
