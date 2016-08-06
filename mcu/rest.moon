Req = require "req"
Res = require "res"
SW = require "sw"
Thermistor = require "thermistor"
Motor = require "motor"
log = require "log"

ctrl =
  temp: 
    evaporator: Thermistor(5)
    condenser: Thermistor(6)
  sw:
    valve: SW.NSwitch(1)
    led: SW.NSwitch(2)
  motor:
    fan: Motor(3)
    pump: Motor(4)

with net.createServer net.TCP
  \listen 80, (conn) ->
    conn\on "receive", (client, data) ->
      req = Req client, data
      res = Res client
      route = "#{req.method} #{req.url}"      
      verbose = (msg) ->
        log.info "#{route}: #{msg}"
      clean = ->
        client\close()
        req = nil
        res = nil
        data = nil
        client = nil
        collectgarbage()
        log.debug "heap: #{node.heap()}"

      switch true

        when route\find("GET /temp/%a+") != nil
          name = route\match "GET /temp/(%a+)"
          res\send ctrl.temp[name]\c(), ->
            verbose "get #{name} temperature"
            clean()

        when route\find("GET /temp") != nil
          ret = {}
          for name, device in pairs ctrl.temp
            ret[name] = device\c()
          res\send ret, ->
            verbose 'get temperature'
            clean()

        when route\find("GET /motor") != nil
          ret = {}
          for name, device in pairs ctrl.motor
            ret[name] = device\state()
          res\send ret, ->
            verbose 'get motor'
            clean()

        when route\find("PUT /motor/%a+/%d+") != nil
          device, val = route\match "PUT /motor/(%a+)/(%d+)"
          val = tonumber val
          ctrl.motor[device]\speed val
          res\send "", ->
            verbose "#{device} speed #{val}"
            clean()

        when route\find("PUT /sw/%a+/toggle") != nil
          name = route\match "PUT /sw/(%a+)/toggle"
          ctrl.sw[name]\toggle()          
          res\send "", ->
            verbose "toggle sw #{name}"
            clean()

        when route\find("PUT /sw/%a+/on") != nil
          name = route\match "PUT /sw/(%a+)/toggle"
          ctrl.sw[name]\on()          
          res\send "", ->
            verbose "on sw #{name}"
            clean()

        when route\find("PUT /sw/%a+/off") != nil
          name = route\match "PUT /sw/(%a+)/toggle"
          ctrl.sw[name]\off()          
          res\send "", ->
            verbose "off sw #{name}"
            clean()

        when route\find("GET /sw/%a+") != nil
          name = route\match "PUT /sw/(%a+)/toggle"
          res\send ctrl.sw[name]\state(), ->
            verbose "get state of sw #{name}"
            clean()

        when route\find("GET /sw") != nil
          ret = {}
          for name, device in pairs ctrl.sw
            ret[name] = device\state()
          res\send ret, ->
            verbose "get state of all sw"
            clean()

	when route\find("GET /heap") != nil
          res\send {heap: node.heap()}, ->
            verbose "get heap"
            clean()

	when route\find("GET /reset") != nil
          res\send "", ->
            verbose "reset"
            clean()
            node.restart()

        else
          res\status 404
          res\send "", ->
            verbose "not found"
            clean()
