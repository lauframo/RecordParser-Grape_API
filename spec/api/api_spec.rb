require_relative "../spec_helper"

describe API do
	
	def app
		WestWing::API
	end

	let!(:browser) { Rack::Test::Session.new(Rack::MockSession.new(app)) }

	describe 'POST api/v1/records' do
		record_params = { "LastName" => "Moreno", "FirstName" => "Laura", "FavoriteColor" => "blue", "DateOfBirth" => "2010-11-08"}
		browser.post 'api/v1/records', record_params	
		context 'with valid data' do
			it 'returns a 200 status code' do
				expect(browser.last_response.status).to eq(200)
			end
			it 'returns the created record' do
				expect(JSON.parse(last_response.body)).to eq({ "LastName" => "Moreno", "FirstName" => "Laura", "FavoriteColor" => "blue", "DateOfBirth" => "2010-11-08"}
			end
			it 'add the record as a row in the database' do
				database = File.read('database_file.csv')
				expect(database.last).to eq "Moreno,Laura,Blue,2010-11-08\n"
			end

		end
	end

end
