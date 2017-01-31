require_relative "../spec_helper"


describe Database do
  let(:database) { Database.new('test_database.csv') }
  # before(:all) {

  describe 'it initializes the database' do
    it 'creates a database file with only headers' do
      expect(database.kind_of?(Database)).to eq true
    end

    it 'enters or updates content with just headers' do
      database.refresh
      database_file = File.read(database.file_name)
      string_representation = "LastName,FirstName,FavoriteColor,DateOfBirth\n"
      expect(database_file).to eq string_representation
    end

    it 'allows you to load an existing database file' do
      database = Database.new('test.csv')
      database.load
      database_file = File.read(database.file_name)
      expect(database_file.lines.count).to eq 3
  end
  end

  describe 'adds objects to the database' do
    jed_args = {"FirstName"=> "Jed", "LastName"=> "Barlett", "FavoriteColor"=> "navy", "DateOfBirth"=> '2015-10-20'}
    jed = Person.new(jed_args)
    toby_args = {"FirstName"=> "Toby", "LastName"=> "Ziegler", "FavoriteColor"=> "magenta", "DateOfBirth"=> '1985-10-15' }
    toby = Person.new(toby_args)

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

    it 'appends new records to the end of a new file' do
      database = Database.new('test_database.csv')
      database.refresh
      database.add(jed)
      database_file = File.read('test_database.csv')
      expect(database_file.lines.count).to eq 2

      database.add(toby)
      database_file = File.read('test_database.csv')
      expect(database_file.lines.count).to eq 3
    end

    it 'appends new records to the end of a loaded file' do
      database = Database.new('test.csv')
      database.load
      database.add(toby)
      database_file = File.read('test.csv')
      expect(database_file.lines.count).to eq 4
    end

  end

  # after(:all) { Database.new }
end
