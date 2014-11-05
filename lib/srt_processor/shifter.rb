module SrtProcessor
  class Shifter
    def initialize(subtitle)
      @subtitle = subtitle
    end

    def shift(seconds)
      @subtitle.dialogs.map do |dialog|
        start_time = shift_time(dialog.start_time, seconds)
        end_time = shift_time(dialog.end_time, seconds)
        Dialog.new(dialog.id, start_time, end_time, dialog.text)
      end
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
