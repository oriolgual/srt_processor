module SrtProcessor
  class Shifter
    def initialize(timestamp)
      @timestamp = timestamp
    end

    def shift(time_to_shift)
      hours, minutes, seconds_and_mili = @timestamp.split(':')
      seconds, milliseconds = seconds_and_mili.split(',')

      if time_to_shift < 1
        milliseconds = (milliseconds.to_i + time_to_shift * 1000).to_i

        if milliseconds > 999
          seconds_to_add = (milliseconds.to_f / 1000).floor.to_i
          seconds = seconds.to_i + seconds_to_add
          milliseconds -= seconds_to_add * 1000
        end
      end

      if time_to_shift >= 1
        seconds = seconds.to_i + time_to_shift

        if seconds > 59
          minutes_to_add = (seconds.to_f / 60).floor.to_i
          minutes = minutes.to_i + minutes_to_add
          seconds -= minutes_to_add * 60
        end

        if minutes.to_i > 59
          hours_to_add = (minutes.to_f / 60).floor.to_i
          hours = hours.to_i + hours_to_add
          minutes -= hours_to_add * 60
        end
      end

      [hours.to_s.rjust(2, '0'), minutes.to_s.rjust(2, '0'), [seconds.to_s.rjust(2, '0'), milliseconds].join(',')].join(':')
    end

  end
end
