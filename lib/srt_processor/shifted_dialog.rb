module SrtProcessor
  class ShiftedDialog
    def initialize(dialog, seconds)
      @dialog = dialog
      @seconds = seconds
    end

    def id
      @dialog.id
    end

    def text
      @dialog.text
    end

    def start_time
      @start_time ||= Shifter.new(@dialog.start_time).shift(@seconds)
    end

    def end_time
      @end_time ||= Shifter.new(@dialog.end_time).shift(@seconds)
    end
  end
end
