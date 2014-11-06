module SrtProcessor
  class Processor
    def initialize(input_file, output_file)
      @input_file = input_file
      @output_file = output_file
    end

    def shift(seconds)
      dialogs = DialogShifter.new(original_subtitle.dialogs).shift(seconds)
      converted_dialogs = DialogConverter.new(dialogs).to_srt
      Exporter.new(@output_file, converted_dialogs).export
    end

    def original_subtitle
      @original_subtitle ||= Subtitle.new(@input_file)
    end
  end
end
