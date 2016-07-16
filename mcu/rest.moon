Req = require "req"
Res = require "res"
Switch = require "sw"
Thermistor = require "thermistor"
Motor = require "motor"
log = require "log"

temp = Thermistor()
sw = { Switch(1), Switch(2) }
motor = { fan: Motor(5) }

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
      verbose = (msg) ->
        log.info "#{route}: #{msg}"

      switch true

        when route\find("GET /temp") != nil
          res\send "#{string.format "%02.2f", temp\c()} C"
          verbose 'get temperature'

        when route\find("PUT /motor/%a+/%d+") != nil
          device, val = route\match "PUT /motor/(%a+)/(%d+)"
          val = tonumber val
          log.debug device
          log.debug val
          motor[device]\speed val
          res\send()
          verbose "#{device} speed #{val}"

        when route\find("PUT /sw/%d+/toggle") != nil
          i = index req.url
          sw[i]\toggle()          
          res\send()
          verbose "toggle sw #{i}"

        when route\find("PUT /sw/%d+/on") != nil
          i = index req.url
          sw[i]\on()          
          res\send()

        when route\find("PUT /sw/%d+/off") != nil
          i = index req.url
          sw[i]\off()          
          res\send()
          verbose "off sw #{i}"

        when route\find("GET /sw/%d+") != nil
          i = index req.url
          res\send sw[i]\state()
          verbose "get state of sw #{i}"

        when route\find("GET /sw") != nil
          res\send {sw[1]\state(), sw[2]\state()}
          verbose "get state of all sw"

        else
          res\status 404
          res\send()
          verbose "not found"

      -- collectgarbage()
