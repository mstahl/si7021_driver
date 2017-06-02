require 'bundler/setup'
require 'si7021'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    Si7021.configure do |c|
      c.i2c_address = 0x40
      c.i2c_device = '/dev/i2c'
    end
  end
end
