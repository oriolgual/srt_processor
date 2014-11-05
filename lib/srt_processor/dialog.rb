module SrtProcessor
  class Dialog
    attr_reader :id, :start_time, :end_time, :text

    def initialize(id, start_time, end_time, text)
      @id = id
      @start_time = start_time
      @end_time = end_time
      @text = text
    end
  end
end
