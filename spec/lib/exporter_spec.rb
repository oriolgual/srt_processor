require 'spec_helper'

module SrtProcessor
  describe Exporter do
    describe 'export' do
      it 'exports the given content to a file' do
        exporter = Exporter.new('/tmp/foo.txt', 'Hi')

        exporter.export

        expect(IO.read('/tmp/foo.txt')).to eq('Hi')
      end
    end
  end
end
