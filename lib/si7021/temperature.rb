module Si7021
  module Temperature
    TRANSFORMATION_FN = -> (raw) {
      175.72 * raw / 65536.0 - 46.85
    }

    @temperature_last_measured = nil

    def self.read
      i2c = I2C.create(Si7021.config.i2c_device)
      i2c.write(Si7021.config.i2c_address, TEMP_NO_HOLD_MASTER)
      sleep 0.250
      bytes = i2c.read(Si7021.config.i2c_address, 2)
      msb, lsb = bytes.unpack('CC')
      raw = msb * 256 + lsb

      TRANSFORMATION_FN.(raw)
    end
  end
end
