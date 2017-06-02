require 'i2c'

require 'si7021/configuration'
require 'si7021/humidity'
require 'si7021/temperature'
require 'si7021/version'

# Module with constants, methods and classes for interacting with Si7021
# temperature/humidity sensors via I2C.
# @see http://www.silabs.com/documents/public/data-sheets/Si7021-A20.pdf
module Si7021
  DEFAULT_I2C_ADDRESS = 0x40

  REL_HUMIDITY_HOLD_MASTER    = 0xE5
  REL_HUMIDITY_NO_HOLD_MASTER = 0xF5
  TEMP_HOLD_MASTER            = 0xE3
  TEMP_NO_HOLD_MASTER         = 0xF3
  TEMP_LAST_HUMIDITY          = 0xE0

  RESET                       = 0xFE
  WRITE_RH_T_USR_REG_1        = 0xE6
  READ_RH_T_USR_REG_1         = 0xE7
  WRITE_HEATER_CTRL_REG       = 0x51
  READ_HEATER_CTRL_REG        = 0x11

  READ_ELECTRONIC_ID_MSB      = 0xFA # 0x0F
  READ_ELECTRONIC_ID_LSB      = 0xFC # 0xC9

  READ_FW_REV                 = 0x84 # 0xB8
end
