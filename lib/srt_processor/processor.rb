module SrtProcessor
  class Processor
    def initialize(input, output)
      @input = input
      @output = output
    end

    def shift(seconds)
      output_dialogs = input_subtitle.dialogs.map do |dialog|
        start_time = shift_time(dialog.start_time, seconds)
        end_time = shift_time(dialog.end_time, seconds)
        Dialog.new(dialog.id, start_time, end_time, dialog.text)
      end

      contents = output_dialogs.map do |dialog|
        [dialog.id, [dialog.start_time, dialog.end_time].join(' --> '), dialog.text].join("\r\n")
      end.join("\r\n\r\n")

      IO.write(@output, contents)
    end

    def input_subtitle
      @input_subtitle ||= Subtitle.new(@input)
    end

    private

    def shift_time(time, shift)
      hours, minutes, seconds_and_mili = time.split(':')
      seconds, mili = seconds_and_mili.split(',')
      seconds_and_mili = [seconds.to_i + shift, mili].join(',')
      [hours, minutes, seconds_and_mili].join(':')
    end
  end
end
