module SrtProcessor
  class Shifter
    def initialize(timestamp)
      @timestamp = timestamp
    end

    def shift(time_to_shift)
      hours, minutes, seconds_and_mili = @timestamp.split(':')
      seconds, mili = seconds_and_mili.split(',')
      seconds_and_mili = [seconds.to_i + time_to_shift, mili].join(',')
      [hours, minutes, seconds_and_mili].join(':')
    end
  end
end
