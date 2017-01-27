##LastName, FirstName, FavoriteColor, DateOfBirth

require_relative '../person'

describe Person do
  let(:laura_args) { {"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "cerulean", "DateOfBirth"=> '2017-01-23' } }
  let(:laura) { Person.new(laura_args)}
  let(:josh_args) { { "FirstName"=> "Josh", "LastName"=> "Lyman", "FavoriteColor"=> "tan", "DateOfBirth"=> '2017-01-19' } }
  let(:josh) { Person.new(josh_args)}
  let(:donna_args) { { "FirstName"=> "Donna", "LastName"=> "Moss", "FavoriteColor"=> "amber", "DateOfBirth"=> '2016-02-25' } }
  let(:donna) { Person.new(donna_args)}

  context 'it has readeable attributes' do

    it 'returns a first name' do
      expect(laura.first_name).to eq "Laura"
    end

    it 'returns a last name' do
      expect(laura.last_name).to eq "Moreno"
    end

    it 'returns a favorite color' do
      expect(laura.favorite_color).to eq "cerulean"
    end

    it 'returns a date of birth' do
      expect(laura.birth_date).to eq "2017-01-23"
    end
  end


  context 'it returns all instances of the Person class' do

    it 'converts Person instances to a hash' do
      expect(laura.to_hash).to eq({"first_name"=>"Laura", "last_name"=>"Moreno", "favorite_color"=>"cerulean", "birth_date"=>"2017-01-23"})
    end

  	 # it 'returns laura, josh and donna in array' do
    #   people = []
    #   Person.all.each do |person|
    #     p person
    #   people << {"FirstName"=> person.first_name, "LastName"=> person.last_name, "FavoriteColor"=> person.favorite_color, "DateOfBirth"=> person.birth_date }
  	 # 	end
    #   expect(people).to contain_exactly({"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "cerulean", "DateOfBirth"=> "2017-01-23"}, {"FirstName"=> "Josh", "LastName"=> "Lyman", "FavoriteColor"=> "tan", "DateOfBirth"=> "2017-01-19"}, {"FirstName"=> "Donna", "LastName"=> "Moss", "FavoriteColor"=> "amber", "DateOfBirth"=> "2016-02-25"})

  	 # end

  end

  context 'it sorts by desired attribute' do
    it 'sorts by favorite color descending, then by last name ascending' do
    	expect(Person.sort_by_color).to contain_exactly(josh, laura, donna)
    end

    it 'sorts by birth date ascending' do
    	expect(Person.sort_by_date).to eq([donna, josh, laura])
    end

    it 'sorts by last name descending' do
    	expect(Person.sort_by_surname).to eq([donna, laura, josh])
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
