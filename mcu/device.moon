SW = require "sw"
Voltmeter = require "voltmeter"
Thermistor = require "thermistor"
Motor = require "motor"

return {
  tempEvap: Thermistor(1)
  tempCond: Thermistor(2)
  voltIn: Voltmeter(3)
  motorEvap: Motor(4)
  motorCond: Motor(5)
  motorPump: Motor(6)
}
