Req = require "req"
Res = require "res"

with net.createServer net.TCP
  \listen 80, (conn) ->
    conn\on "receive", (client, data) ->
      req = Req client, data
      res = Res client
      switch "#{req.method} #{req.url}"
        when "GET /"
          res\send req
        else
          res\status 404
          res\send()
      collectgarbage()
