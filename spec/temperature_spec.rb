require 'spec_helper'

module Si7021
  RSpec.describe Temperature do
    let(:temperature) { 20.0 }
    let(:i2c) { instance_double(I2C::Dev) }
    let(:raw_temperature) { ((temperature + 46.85)*65536/175.72).round }
    let(:returned_bytes) do
      lsb = raw_temperature & 0xFF
      msb = (raw_temperature & 0xFF00) >> 8
      [msb, lsb].pack('CC')
    end

    before do
      allow(I2C).to receive(:create).and_return(i2c)
      allow(i2c).to receive(:read).with(DEFAULT_I2C_ADDRESS, 2).and_return(returned_bytes)
      allow(i2c).to receive(:write).with(DEFAULT_I2C_ADDRESS, TEMP_NO_HOLD_MASTER)
    end

    describe '#read' do
      it 'reads the temperature accurately' do
        expect(Si7021::Temperature.read).to be_within(0.001).of(temperature)
      end
    end

    describe '#read_stored' do
      before do
        pending "These aren't implemented yet"
      end

      context 'when a humidity measurement has already been taken' do
        it 'reads the stored temperature' do
          expect(Si7021::Temperature.read_stored).to be_within(0.001).of(20.0)
        end
      end

      context 'when a humidity measurement has not already been taken' do
        it 'raises an exception' do
          expect {
            Si7021::Temperature.read_stored
          }.to raise_error(Si7021::TemperatureNotYetStored)
        end
      end
    end
  end
end
