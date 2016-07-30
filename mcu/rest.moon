Req = require "req"
Res = require "res"
SW = require "sw"
Thermistor = require "thermistor"
Motor = require "motor"
log = require "log"

temp = 
  evaporator: Thermistor(5)
  condenser: Thermistor(6)
sw = 
  valve: SW.NSwitch(1)
  led: SW.NSwitch(2)
motor = 
  fan: Motor(3)
  pump: Motor(4)

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

        when route\find("GET /temp/%a+") != nil
          device = route\match "GET /temp/(%a+)"
          res\send temp[device]\c()
          verbose "get #{device} temperature"

        when route\find("GET /temp") != nil
          ret = {}
          for name, device in pairs temp
            ret[name] = device\c()
          res\send ret
          verbose 'get temperature'

        when route\find("PUT /motor/%a+/%d+") != nil
          device, val = route\match "PUT /motor/(%a+)/(%d+)"
          val = tonumber val
          motor[device]\speed val
          res\send()
          verbose "#{device} speed #{val}"

        when route\find("PUT /sw/%a+/toggle") != nil
          i = index req.url
          sw[i]\toggle()          
          res\send()
          verbose "toggle sw #{i}"

        when route\find("PUT /sw/%a+/on") != nil
          i = index req.url
          sw[i]\on()          
          res\send()

        when route\find("PUT /sw/%a+/off") != nil
          i = index req.url
          sw[i]\off()          
          res\send()
          verbose "off sw #{i}"

        when route\find("GET /sw/%a+") != nil
          i = index req.url
          res\send sw[i]\state()
          verbose "get state of sw #{i}"

        when route\find("GET /sw") != nil
          ret = {}
          for name, device in pairs sw
            ret[name] = device\state()
          res\send ret
          verbose "get state of all sw"

	when route\find("GET /reset") != nil
          res\send()
          verbose "reset"
          node.restart()

        else
          res\status 404
          res\send()
          verbose "not found"

      -- collectgarbage()
