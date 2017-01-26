require_relative '../record_parser'

describe RecordParser do
  let (:data) { "LastName|FirstName|FavoriteColor|DateOfBirth"}
  let (:result) { "LastName|FirstName|FavoriteColor|DateOfBirth" }
  let (:pipe_file) { RecordParser.parse("records_pipe_delimited.csv") }
  let (:comma_file) { RecordParser.parse("records.csv") }

  context 'should read in the CSV' do
    it 'should parse file content and return a result' do
      expect(File.to receive(:open).with("filename")).to eq result
    end
  end


  context 'it parses all records' do
     it 'parsed all pipe-delimited records' do
      expect(pipe_file.length).to eq 2
    end

    it 'parsed all comma-delimited records' do
      expect(comma_file.length).to eq 2
    end
  end

  context 'converted to Person class instances' do
    it 'converted each pipe-delimited record to an instance of a Person class' do
      expect(pipe_file.first.class).to eq Person
    end

     it 'converted each comma-delimited record to an instance of a Person class' do
      expect(comma_file.first.class).to eq Person
    end
  end


end
