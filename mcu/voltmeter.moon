-- see http://www.instructables.com/id/ESP8266-with-Multiple-Analog-Sensors/
-- for details to connect multiple sensors
Switch = require("sw").Switch

class Voltmeter
  new: (enablePin, @pin = 0, @v=3.3) =>
    @enable = Switch(enablePin)
    adc.force_init_mode adc.INIT_ADC

  value: =>
    @enable\on()
    ret = adc.read(@pin) * @v / 1024
    @enable\off()
    return ret

return Voltmeter
