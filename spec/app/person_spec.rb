require_relative "../spec_helper"

describe Person do

	describe 'it has readable attributes' do
		josh_args = { "FirstName"=> "Josh", "LastName"=> "Lyman", "FavoriteColor"=> "tan", "DateOfBirth"=> '2017-01-19' } 
		josh = Person.new(josh_args)
			
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

    	it 'converts Person instances to a hash' do
      		expect(josh.to_hash).to eq({"first_name"=>"Josh", "last_name"=>"Lyman", "favorite_color"=>"tan", "birth_date"=>"2017-01-19"})
    	end
	end


	describe 'it returns all instances of the Person class' do
		it 'returns correct number of total Person objects' do
			expect(Person.all.length).to eq(5)
		end
	end

	describe 'it sorts by desired attribute' do
    	it 'sorts by favorite color descending, then by last name ascending' do
      		expect(RecordParser.hash_output(Person.sort_by_color)).to eq([{"first_name"=>"Josh", "last_name"=>"Lyman", "favorite_color"=>"tan", "birth_date"=>"2017-01-19"}, {"first_name"=>"Jed", "last_name"=>"Barlett", "favorite_color"=>"navy", "birth_date"=>"2015-10-20"}, {"first_name"=>"Toby", "last_name"=>"Ziegler", "favorite_color"=>"magenta", "birth_date"=>"1985-10-15"}, {"first_name"=>"Laura", "last_name"=>"Moreno", "favorite_color"=>"blue", "birth_date"=>"2017-01-17"}, {"first_name"=>"Laura", "last_name"=>"Moreno", "favorite_color"=>"blue", "birth_date"=>"2017-01-17"}])
    	end

    	it 'sorts by birth date ascending' do
      		expect(RecordParser.hash_output(Person.sort_by_birthdate)).to eq([{"first_name"=>"Toby", "last_name"=>"Ziegler", "favorite_color"=>"magenta", "birth_date"=>"1985-10-15"}, {"first_name"=>"Jed", "last_name"=>"Barlett", "favorite_color"=>"navy", "birth_date"=>"2015-10-20"}, {"first_name"=>"Laura", "last_name"=>"Moreno", "favorite_color"=>"blue", "birth_date"=>"2017-01-17"}, {"first_name"=>"Laura", "last_name"=>"Moreno", "favorite_color"=>"blue", "birth_date"=>"2017-01-17"}, {"first_name"=>"Josh", "last_name"=>"Lyman", "favorite_color"=>"tan", "birth_date"=>"2017-01-19"}])
    	end

		it 'sorts by last name descending' do
			expect(RecordParser.hash_output(Person.sort_by_surname)).to eq([{"first_name"=>"Toby", "last_name"=>"Ziegler", "favorite_color"=>"magenta", "birth_date"=>"1985-10-15"}, {"first_name"=>"Laura", "last_name"=>"Moreno", "favorite_color"=>"blue", "birth_date"=>"2017-01-17"}, {"first_name"=>"Laura", "last_name"=>"Moreno", "favorite_color"=>"blue", "birth_date"=>"2017-01-17"}, {"first_name"=>"Josh", "last_name"=>"Lyman", "favorite_color"=>"tan", "birth_date"=>"2017-01-19"}, {"first_name"=>"Jed", "last_name"=>"Barlett", "favorite_color"=>"navy", "birth_date"=>"2015-10-20"}])
    	end
  	end
end