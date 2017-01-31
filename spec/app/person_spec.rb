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
			expect(Person.all.length).to eq(8)
		end
	end

	describe 'it sorts by desired attribute' do
    	it 'sorts by favorite color descending, then by last name ascending' do
      	expect(Person.hash_output(Person.sort_by_color)).to eq([{"FirstName"=> "Josh", "LastName"=> "Lyman", "FavoriteColor"=> "tan", "DateOfBirth"=> "2017-01-19"}, {"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "cerulean", "DateOfBirth"=> "2017-01-23"}, {"FirstName"=> "Donna", "LastName"=> "Moss", "FavoriteColor"=> "amber", "DateOfBirth"=> "2016-02-25"}])
    	end
	end