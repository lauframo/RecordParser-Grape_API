require_relative "../spec_helper"


describe Database do
  # before(:all) {

  describe 'it initializes the database' do
    let(:database) { Database.new('test_database.csv') }
    it 'creates a database file with only headers' do
      database_file = File.read(database.file_name)
      string_representation = "LastName,FirstName,FavoriteColor,DateOfBirth\n"

      expect(database_file).to eq string_representation
    end
  end

  describe 'adds objects to the database' do
    let(:jed_args) { {"FirstName"=> "Jed", "LastName"=> "Barlett", "FavoriteColor"=> "navy", "DateOfBirth"=> '2015-10-20' } }
    let(:jed) { Person.new(jed_args)}
    let(:toby_args) { {"FirstName"=> "Toby", "LastName"=> "Ziegler", "FavoriteColor"=> "magenta", "DateOfBirth"=> '1985-10-15' } }
    let(:toby) { Person.new(toby_args)}
    
    it 'raises an error if a non-Person object is passed to be added' do
      item = "Ziegler,Toby,magenta,1985-10-15"
      expect{ database.add(item) }.to raise_error(Database::NoPersonError)
    end

    it 'adds a Person object as a new row in database file' do
      database = Database.new('test_database.csv')
      database.add(toby)
      database_file = File.read('test_database.csv')
      expected_string = "LastName,FirstName,FavoriteColor,DateOfBirth\nZiegler,Toby,magenta,1985-10-15\n"
      expect(database_file).to eq expected_string
    end

    it 'appends new records to the end of the file' do
      database = Database.new('test_database.csv')
      database.add(jed)
      database_file = File.read('test_database.csv')
      expect(database_file.lines.count).to eq 2

      database.add(toby)
      database_file = File.read('test_database.csv')
      expect(database_file.lines.count).to eq 3
    end

  end

  # after(:all) { Database.new }
end
