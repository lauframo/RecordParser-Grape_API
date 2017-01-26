require_relative '../database'

describe Database do
  let(:jed_args) { {"FirstName"=> "Jed", "LastName"=> "Barlett", "FavoriteColor"=> "navy", "DateOfBirth"=> '2015-10-20' } }
  let(:jed) { Person.new(jed_args)}
  let(:toby_args) { {"FirstName"=> "Toby", "LastName"=> "Ziegler", "FavoriteColor"=> "magenta", "DateOfBirth"=> '1985-10-15' } }
  let(:jed) { Person.new(jed_args)}

  context 'it initializes the database' do
    it 'raises an error if database object has not be initialized' do
      database_file = File.read('database.csv').to raise_error
    end

    it 'creates a database file with only headers' do
      database = Database.new
      database_file = File.read('database.csv')
      string_representation = "LastName,FirstName,FavoriteColor,DateOfBirth\n"

      expect(database_file).to eq string_representation
    end
  end

  context 'adds objects to the database' do
    it 'raises an error if a non-Person object is passed to be added' do
      database = Database.new
      item = "Ziegler,Toby,magenta,1985-10-15"
      expect(database.add(item)).to raise_error("Not an instance of Person class")
    end

    it 'adds a Person object as a new row in database file' do
      database = Database.new
      database.add(jed)
      database_file = File.read('database.csv')
      expected_string = "LastName,FirstName,FavoriteColor,DateOfBirth\nZiegler,Toby,magenta,1985-10-15"
      expect(database_file).to eq expected_string
    end

    it 'appends new records to the end of the file' do
      database = Database.new
      database.add(jed)
      database_file = File.read('database.csv')
      expect(database_file.lines.count).to eq 2

      database.add(toby)
      database_file = File.read('database.csv')
      expect(database_file.lines.count).to eq 3
    end

  end






end
