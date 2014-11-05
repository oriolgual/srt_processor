module SrtProcessor
  class Exporter
    def initialize(output, dialogs)
      @output_file = output
      @dialogs = dialogs
    end

    def export
      IO.write(@output_file, contents)
    end

    private

    def contents
      @dialogs.map do |dialog|
        [dialog.id, [dialog.start_time, dialog.end_time].join(' --> '), dialog.text].join("\r\n")
      end.join("\r\n\r\n")
    end
  end
end
