module SrtProcessor
  class Processor
    def initialize(input, output)
      @input = input
      @output = output
    end

    def shift(seconds)
      output_dialogs = Shifter.new(input_subtitle).shift(seconds)
      Exporter.new(@output, output_dialogs).export
    end

    def input_subtitle
      @input_subtitle ||= Subtitle.new(@input)
    end
  end
end
