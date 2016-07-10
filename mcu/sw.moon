-- gpio state inverted
LOW = gpio.HIGH
HIGH = gpio.LOW

class Switch
  new: (pin) =>
    @pin = pin
    @value = LOW
    gpio.mode @pin, gpio.OUTPUT
    gpio.write @pin, @value

  -- gpio state inverted
  state: =>
    if @value == LOW then HIGH else LOW

  toggle: (@value = if @value == LOW then HIGH else LOW) =>
    gpio.write @pin, @value
    return @
    
  on: =>
    @toggle HIGH

  off: =>
    @toggle LOW

return Switch
