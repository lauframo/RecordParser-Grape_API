require_relative "../spec_helper"


describe RecordParser do
  # before(:suite) { Database.new }

  let (:pipe_file) { RecordParser.parse_file("./spec/test_files/records_pipe_delimited.csv") }
  let (:comma_file) { RecordParser.parse_file("./spec/test_files/records_comma_delimited.csv") }
  let (:parsed_comma_string) {RecordParser.parse_string(comma_string)}

  context 'should read in the CSV' do
     it 'parsed all pipe-delimited records' do
      expect(pipe_file.length).to eq 3
    end

    it 'parsed all comma-delimited records' do
      expect(comma_file.length).to eq 3
    end
  end

  context 'converted to Person class instances' do
    it 'created Person objects for each row' do
    	total_elements = comma_file + pipe_file
    	person_collection = total_elements.select {|elem| elem.kind_of?(Person)}
        expect(person_collection.length).to eq 6
    end

    it 'converted each pipe-delimited record to an instance of a Person class' do
      expect(pipe_file.first.kind_of?(Person)).to eq true
    end

     it 'converted each comma-delimited record to an instance of a Person class' do
      expect(comma_file.first.kind_of?(Person)).to eq true
    end
  end

  context 'it parses a string succesfully' do
    let (:pipe_string) { "Moreno|Laura|Blue|2017-01-17" }
    let (:comma_string) { "Moreno,Laura,Blue,2017-01-17" }
    let (:parsed_pipe_string) {RecordParser.parse_string(pipe_string)}
    let (:parsed_comma_string) {RecordParser.parse_string(comma_string)}

    it 'parses a pipe-delimited string into a Person object' do
      expect(parsed_pipe_string.first.kind_of?(Person)).to eq true
    end
     it 'parses a comma-delimited string into a Person object' do
      expect(parsed_comma_string.first.kind_of?(Person)).to eq true
    end
  end

  it 'takes a collection of Person objects and returns an array of hashes' do
    collection = Array.new.push(pipe_file[0], comma_file[1])
    expect(RecordParser.hash_output(collection)).to eq([{"first_name"=>"Laura",
        "last_name"=>"Moreno", "favorite_color"=>"Blue", "birth_date"=>"2017-01-17"}, {"first_name"=>"Tom", "last_name"=>"Cruise", "favorite_color"=>"Crimson",
        "birth_date"=>"2016-02-28"}])

  end


  # after(:suite) { Database.new }


end
