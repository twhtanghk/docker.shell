-- see http://www.instructables.com/id/ESP8266-with-Multiple-Analog-Sensors/
-- for details to connect multiple sensors
Switch = require("sw").Switch

class Voltmeter
  @v: 3.3

  new: (enablePin) =>
    @enable = Switch(enablePin)
    adc.force_init_mode adc.INIT_ADC

  value: =>
    @enable\on()
    ret = adc.read(0)
    @enable\off()
    return ret * @@v / 1024

return Voltmeter
