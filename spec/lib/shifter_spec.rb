require 'spec_helper'

module SrtProcessor
  describe Shifter do
    describe 'shift' do
      it 'shifts a subtitle timestamp' do
        timestamp = "00:02:26,371"

        shifted_timestamp = Shifter.new(timestamp).shift(2)

        expect(shifted_timestamp).to eq("00:02:28,371")
      end
    end
  end
end
