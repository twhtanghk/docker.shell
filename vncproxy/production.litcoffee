    module.exports =

authorized oauth2 client to trigger reload list of vm defined in vm service

      authClient: [
        'client_credentials'
      ]

oauth2 server settings

      oauth2:

oauth2 server url to verify and acquire token

        url: 
          verify: 'https://abc.com/auth/oauth2/verify/'
          token: 'https://abc.com/auth/oauth2/token/'

oauth2 client for resource owner password credentials grant

        client: # oauth2 client for resource owner password credentials grant
          id: 'client_id'
          secret: 'client_secret'

administrator to connect proxy service for creating/destroying http reverse proxy

        user:
          id: 'user_id'
          secret: 'user_secret'

        scope: [
          'User'
        ]

url for vm api and host to connect defined vm

      vm:
        url: 'http://abc.com:1337/api/vm'

url for proxy api

      proxy: # url for proxy api
        url: 'http://abc.com:1337/upstream'

url for docker engine to create novnc container

      docker:
        url: 'http://192.168.121.1:2375'
