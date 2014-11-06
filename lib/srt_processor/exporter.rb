module SrtProcessor
  class Exporter
    def initialize(file, content)
      @file = file
      @content = content
    end

    def export
      IO.write(@file, @content)
    end
  end
end
