require_relative "../spec_helper"

describe API do
	
	def app
		WestWing::API
	end

	let(:record_collection) { RecordParser.file_parser('testfile.csv')}
	let!(:browser) { Rack::Test::Session.new(Rack::MockSession.new(app)) }

	describe 'POST api/v1/records' do

		context 'with valid data' do
			record_params = { "LastName" => "Moreno", "FirstName" => "Laura", "FavoriteColor" => "blue", "DateOfBirth" => "2010-11-08"}
			browser.post 'api/v1/records', record_params

			it 'returns a 200 status code' do
				expect(browser.last_response.status).to eq(200)
			end

			it 'returns the created record' do
				expect(JSON.parse(last_response.body)).to eq({ "LastName" => "Moreno", "FirstName" => "Laura", "FavoriteColor" => "blue", "DateOfBirth" => "2010-11-08"})
			end

			it 'add the record as a row in the database' do
				database = File.read('database_file.csv')
				expect(database.last).to eq "Moreno,Laura,Blue,2010-11-08\n"
			end
		end
	
		context 'with invalid data' do 
			record_params = { "FirstName" => "Laura", "FavoriteColor" => "blue", "DateOfBirth" => "2010-11-08"}
			browser.post 'api/v1/records', record_params

			it 'returns an error' do
				response = JSON.parse(last_response.body)
				expect(response['message']).to eq("Last Name can't be blank")
			end
		end
	end


	describe 'GET /api/v1/color' do
		browser.get '/api/v1/color'
		it 'returns a 200 status code' do
	    	expect(browser.last_response.status).to eq(200)
	    end

	    it 'returns data sorted by color descending, then by surname' do
	    	expect(JSON.parse(last_response.body)).to eq(Person.hash_ouput(Person.sort_by_color))
	    end
	end

	describe 'GET /api/v1/birthdate' do
		browser.get 'api/v1/birthdate'
		it 'returns a 200 status code' do
	    	expect(browser.last_response.status).to eq(200)
	    end
	    it 'returns data sorted by birthdate' do
	    	expect(JSON.parse(last_response.body)).to eq(Person.hash_ouput(Person.birthdate))
	    end
	end	

	describe 'GET /api/v1/name' do
		browser.get 'api/v1/name'
		it 'returns a 200 status code' do
	    	expect(browser.last_response.status).to eq(200)
	    end
	    it 'returns data sorted by name' do
	    	expect(JSON.parse(last_response.body)).to eq(Person.hash_ouput(Person.sort_by_surname))
	    end
	end	

end
