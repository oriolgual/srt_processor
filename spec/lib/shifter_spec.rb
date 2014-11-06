require 'spec_helper'

module SrtProcessor
  describe Shifter do
    describe 'shift' do
      let(:timestamp) { "00:02:26,371" }
      let(:shifter)   { Shifter.new(timestamp) }

      it 'shifts a subtitle timestamp' do
        shifted_timestamp = shifter.shift(2)

        expect(shifted_timestamp).to eq("00:02:28,371")
      end

      context 'when the shifting time is less than one second' do
        it 'shifts the timestamp in milliseconds' do
          shifted_timestamp = shifter.shift(0.029)

          expect(shifted_timestamp).to eq("00:02:26,400")
        end
      end

      context 'when shifting changes the minute' do
        it 'shifts the timestamp correctly' do
          shifted_timestamp = shifter.shift(40)

          expect(shifted_timestamp).to eq("00:03:06,371")
        end
      end

      context 'when shifting changes the hour' do
        let(:timestamp) { "00:59:59,000" }

        it 'shifts the timestamp correctly' do
          shifted_timestamp = shifter.shift(2)

          expect(shifted_timestamp).to eq("01:00:01,000")
        end
      end

      context 'when shifting changes the seconds' do
        let(:timestamp) { "00:00:00,900" }

        it 'shifts the timestamp correctly' do
          shifted_timestamp = shifter.shift(0.5)

          expect(shifted_timestamp).to eq("00:00:01,400")
        end
      end
    end
  end
end
