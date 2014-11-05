require 'spec_helper'

module SrtProcessor
  describe Processor do
    describe 'shift' do
      it 'shifts the subtitles in time' do
        input = File.expand_path('spec/support/subtitle.srt')
        output = File.expand_path('spec/support/shifted_subtitle.srt')

        processor = Processor.new(input, output)
        processor.shift(2)

        input_subtitle = processor.input_subtitle
        output_subtitle = Subtitle.new(output)

        expect(input_subtitle.dialogs.first.start_time).to eq('00:02:26,371')
        expect(output_subtitle.dialogs.first.start_time).to eq('00:02:28,371')
      end
    end
  end
end
