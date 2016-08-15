SW = require "sw"
Voltmeter = require "voltmeter"
Thermistor = require "thermistor"
Motor = require "motor"

return {
  temp:
    evap: Thermistor(1)
    cond: Thermistor(2)
  volt:
    input: Voltmeter(3)
  motor:
    evap: Motor(4)
    cond: Motor(5)
    pump: Motor(6)
}
