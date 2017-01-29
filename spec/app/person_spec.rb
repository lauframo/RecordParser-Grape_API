require_relative "../spec_helper"

describe Person do
  let(:laura_args) { {"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "cerulean", "DateOfBirth"=> '2017-01-23' } }
  let(:laura) { Person.new(laura_args) }
  let(:josh_args) { { "FirstName"=> "Josh", "LastName"=> "Lyman", "FavoriteColor"=> "tan", "DateOfBirth"=> '2017-01-19' } }
  let(:josh) { Person.new(josh_args) }
  let(:donna_args) { { "FirstName"=> "Donna", "LastName"=> "Moss", "FavoriteColor"=> "amber", "DateOfBirth"=> '2016-02-25' } }
  let(:donna) { Person.new(donna_args) }

  context 'it has readeable attributes' do
    it 'returns a first name' do
      expect(josh.first_name).to eq "Josh"
    end

    it 'returns a last name' do
      expect(josh.last_name).to eq "Lyman"
    end

    it 'returns a favorite color' do
      expect(josh.favorite_color).to eq "tan"
    end

    it 'returns a date of birth' do
      expect(josh.birth_date).to eq "2017-01-19"
    end
  end


  context 'it returns all instances of the Person class' do
    it 'converts Person instances to a hash' do
      expect(josh.to_hash).to eq({"first_name"=>"Josh", "last_name"=>"Lyman", "favorite_color"=>"tan", "birth_date"=>"2017-01-19"})
    end

  	 it 'returns laura, josh and donna in array' do
      expect(Person.hash_output(Person.all)).to eq([{"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "cerulean", "DateOfBirth"=> "2017-01-23"}, {"FirstName"=> "Josh", "LastName"=> "Lyman", "FavoriteColor"=> "tan", "DateOfBirth"=> "2017-01-19"}, {"FirstName"=> "Donna", "LastName"=> "Moss", "FavoriteColor"=> "amber", "DateOfBirth"=> "2016-02-25"}])
  	 end

  end

  context 'it sorts by desired attribute' do
    it 'sorts by favorite color descending, then by last name ascending' do
      expect(Person.hash_output(Person.sort_by_color)).to eq([{"FirstName"=> "Josh", "LastName"=> "Lyman", "FavoriteColor"=> "tan", "DateOfBirth"=> "2017-01-19"}, {"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "cerulean", "DateOfBirth"=> "2017-01-23"}, {"FirstName"=> "Donna", "LastName"=> "Moss", "FavoriteColor"=> "amber", "DateOfBirth"=> "2016-02-25"}])
    end

    it 'sorts by birth date ascending' do
    	expect(Person.hash_output(Person.sort_by_birthdate)).to eq([{"FirstName"=> "Donna", "LastName"=> "Moss", "FavoriteColor"=> "amber", "DateOfBirth"=> "2016-02-25"}, {"FirstName"=> "Josh", "LastName"=> "Lyman", "FavoriteColor"=> "tan", "DateOfBirth"=> "2017-01-19"}, {"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "cerulean", "DateOfBirth"=> "2017-01-23"}])
    end

    it 'sorts by last name descending' do
      expect(Person.hash_output(Person.sort_by_surname)).to eq([{"FirstName"=> "Donna", "LastName"=> "Moss", "FavoriteColor"=> "amber", "DateOfBirth"=> "2016-02-25"}, {"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "cerulean", "DateOfBirth"=> "2017-01-23"}, {"FirstName"=> "Josh", "LastName"=> "Lyman", "FavoriteColor"=> "tan", "DateOfBirth"=> "2017-01-19"}])
    end
  end

  context 'saves instances to the database' do
    it 'takes an instances and saves it to database' do
       expected_database = File.read('records.csv')
       generated_database = File.read('database.csv')
       expect(generated_database) == expected_database
    end

  end
end
