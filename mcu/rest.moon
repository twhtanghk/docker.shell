Req = require "req"
Res = require "res"
Switch = require "sw"
log = { debug: print }

sw = {Switch(1), Switch(2)}

index = (url) ->
  tonumber url\match "/(%d+)"

action = (url) ->
  url\match "/%d+/(%a+)"

with net.createServer net.TCP
  \listen 80, (conn) ->
    conn\on "receive", (client, data) ->
      req = Req client, data
      res = Res client
      route = "#{req.method} #{req.url}"      
      log.debug route

      switch true

        when route\find("GET /all") != nil
          res\send {sw[1]\state(), sw[2]\state()}

        when route\find("GET /%d+") != nil
          res\send sw[index req.url]\state()

        when route\find("PUT /%d+/toggle") != nil
          sw[index req.url]\toggle()          
          res\send()

        when route\find("PUT /%d+/on") != nil
          sw[index req.url]\on()          
          res\send()

        when route\find("PUT /%d+/off") != nil
          sw[index req.url]\off()          
          res\send()

        when route\find("GET /") != nil
          res\send req

        else
          res\status 404
          res\send()

      collectgarbage()
