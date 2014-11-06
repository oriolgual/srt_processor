module SrtProcessor
  class DialogShifter
    def initialize(dialogs)
      @dialogs = dialogs
    end

    def shift(seconds)
      @dialogs.map do |dialog|
        ShiftedDialog.new(dialog, seconds)
      end
    end
  end
end
