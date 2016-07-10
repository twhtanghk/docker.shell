log = require "log"
ln = require "ln"

class Thermistor
  new: (@pin = 0, @r2=10000) =>
    adc.force_init_mode adc.INIT_ADC

  k: =>
    r1 = @r2 * ((1024 / adc.read(@pin)) - 1)
    temp = ln r1
    return 1 / (0.001129148 + (0.000234125 + (0.0000000876741 * temp * temp)) * temp)

  c: =>
    @k() - 273.15

  f: =>
    (@c() * 9 / 5) + 32

return Thermistor
