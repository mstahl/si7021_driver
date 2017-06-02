# frozen_string_literal: true

require 'spec_helper'

module Si7021
  RSpec.describe Configuration do
    let(:example_i2c_address) { 0xFF }
    let(:example_i2c_device) { '/dev/this_is_not_a_real_device' }

    before(:all) do
      @__configuration = Si7021.config.dup
    end

    describe '.configure' do
      before do
        Si7021.configure do |c|
          c.i2c_address = example_i2c_address
          c.i2c_device = example_i2c_device
        end
      end

      it 'sets @i2c_address' do
        expect(Si7021.config.i2c_address).to eq example_i2c_address
      end

      it 'sets @i2c_device' do
        expect(Si7021.config.i2c_device).to eq example_i2c_device
      end
    end

    after(:all) do
      Si7021.config = @__configuration # rubocop:disable RSpec/InstanceVariable
    end
  end
end
