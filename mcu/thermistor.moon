-- see http://www.instructables.com/id/ESP8266-with-Multiple-Analog-Sensors/
-- for details to connect multiple sensors
Switch = require("sw").Switch
ln = require "ln"

class Thermistor
  new: (enablePin, @pin = 0, @r2=10000) =>
    @enable = Switch(enablePin)
    adc.force_init_mode adc.INIT_ADC

  k: =>
    @enable\on()
    r1 = @r2 * ((1024 / adc.read(@pin)) - 1)
    @enable\off()
    temp = ln r1
    return 1 / (0.001129148 + (0.000234125 + (0.0000000876741 * temp * temp)) * temp)

  c: =>
    return @k() - 273.15

  f: =>
    (@c() * 9 / 5) + 32

return Thermistor
