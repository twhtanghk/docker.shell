-- setup pin to contorl motor speed
class Motor
  new: (@pin, @val = 0) =>
    pwm.setup @pin, 1000, @val
    pwm.start @pin

  speed: (@val = 0) =>
    pwm.setduty @pin, @val

  stop: =>
    pwm.stop @pin

  state: =>
    pwm.getclock @pin
    pwm.getduty @pin
   
return Motor
