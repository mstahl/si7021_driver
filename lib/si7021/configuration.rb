# frozen_string_literal: true
module Si7021 # :nodoc:
  class << self
    attr_writer :config
  end

  # You may use `Si7021.configure` to configure various settings about the
  # Si7021 driver, such as which udevd device to use to communicate to it and
  # what I2C address to use for the communications.
  # @see .configure
  class Configuration
    DEFAULTS = {
      i2c_address: 0x40,
      i2c_device: '/dev/i2c',
    }.freeze

    DEFAULTS.each_key do |k|
      attr_accessor k
    end

    def initialize
      DEFAULTS.each_key do |k|
        instance_variable_set(:"@#{k}", DEFAULTS[k])
      end
    end
  end

  # Configure Si7021 driver.
  #
  # @example
  #
  #   Si7021.configure do |c|
  #     c.i2c_address = '0x40'    # Default from Si7021 datasheet
  #     c.i2c_device = '/dev/i2c' # Default for Raspberry Pi running Debian
  #   end
  #
  # @yield [configuration] block to configure Si7021 driver
  # @return [Si7021::Configuration] the completed configuration
  def self.configure
    yield(self.config)
  end

  # Returns a reference to the current configuration.
  #
  # @return [Si7021::Configuration]
  def self.config
    @config ||= Configuration.new
  end
end
