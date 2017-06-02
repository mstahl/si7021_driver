require 'spec_helper'

module Si7021
  RSpec.describe Humidity do
    let(:humidity) { 20.0 }
    let(:i2c) { instance_double(I2C::Dev) }
    let(:raw_humidity) { ((humidity + 6.0)*65536/125).round }
    let(:returned_bytes) do
      lsb = raw_humidity & 0xFF
      msb = (raw_humidity & 0xFF00) >> 8
      [msb, lsb].pack('CC')
    end

    before do
      allow(I2C).to receive(:create).and_return(i2c)
      allow(i2c).to receive(:read).with(DEFAULT_I2C_ADDRESS, 2).and_return(returned_bytes)
      allow(i2c).to receive(:write).with(DEFAULT_I2C_ADDRESS, REL_HUMIDITY_NO_HOLD_MASTER)
    end

    describe '#read' do
      it 'reads the humidity accurately' do
        expect(Si7021::Humidity.read).to be_within(1).of(humidity)
      end
    end
  end
end
