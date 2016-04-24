class Switch
  new: (pin) =>
    @pin = pin
    gpio.mode @pin, gpio.OUTPUT, gpio.PULLUP

  state: =>
    gpio.read(@pin)

  toggle: (value) =>
    switch value
      when gpio.LOW
        gpio.write @pin, gpio.LOW
      when gpio.HIGH
        gpio.write @pin, gpio.HIGH
      else
        gpio.write @pin, if @state() == gpio.LOW then gpio.HIGH else gpio.LOW
    return @
    
  on: =>
    @toggle gpio.HIGH

  off: =>
    @toggle gpio.LOW

return Switch
