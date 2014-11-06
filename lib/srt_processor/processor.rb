module SrtProcessor
  class Processor
    def initialize(input, output)
      @input = input
      @output = output
    end

    def shift(seconds)
      dialogs = output_dialogs(seconds)
      content = output_content(dialogs)
      Exporter.new(@output, content).export
    end

    def input_subtitle
      @input_subtitle ||= Subtitle.new(@input)
    end

    private
    def output_content(dialogs)
      dialogs.map do |dialog|
        [dialog.id, [dialog.start_time, dialog.end_time].join(' --> '), dialog.text].join("\r\n")
      end.join("\r\n\r\n")
    end

    def output_dialogs(seconds)
      input_subtitle.dialogs.map do |dialog|
        shifted_start_time = Shifter.new(dialog.start_time).shift(seconds)
        shifted_end_time = Shifter.new(dialog.end_time).shift(seconds)
        Dialog.new(dialog.id, shifted_start_time, shifted_end_time, dialog.text)
      end
    end
  end
end
