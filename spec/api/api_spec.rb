require_relative "../spec_helper"
require 'rack/test'

module WestWing
	describe API do
		def app
			WestWing::API
		end
		# before(:all) { RecordParser.parse_file('api_records.csv')}
		let(:database) { Database.new('api_test.csv')}
		let(:browser) { Rack::Test::Session.new(Rack::MockSession.new(app)) }

		describe 'POST /v1' do
			let(:record) {{ "LastName" => "Moreno", "FirstName" => "Laura", "FavoriteColor" => "blue", "DateOfBirth" => "2010-11-08"}}

			context 'with valid data' do
				let(:record_collection) { RecordParser.file_parser('testfile.csv')}
				it 'returns a 201 status code' do
				 	browser.post '/v1', record
					expect(browser.last_response.status).to eq(201)
				end

				it 'returns the created record' do
					browser.post '/v1', record
					expect(JSON.parse(browser.last_response.body)).to eq({"first_name"=>"Laura", "last_name"=>"Moreno", "favorite_color"=>"blue", "birth_date"=>"2010-11-08"})
				end

				it 'add the record as a row in the database' do
					database = File.read('database_file.csv')
					expect(database.last).to eq "Moreno,Laura,Blue,2010-11-08\n"
				end
			end
		
			context 'with invalid data' do 
				record_params = { "FirstName" => "Laura", "FavoriteColor" => "blue", "DateOfBirth" => "2010-11-08"}
				before(:each) { browser.post 'v1/records', record_params }

				it 'returns an error' do
					response = JSON.parse(last_response.body)
					expect(response['message']).to eq("Last Name can't be blank")
				end
			end
		end


		describe 'GET /v1/color' do
			before(:all) { RecordParser.parse_file('api_records.csv')}
			before(:each) { browser.get '/v1/color' }
			it 'returns a 200 status code' do
		    	expect(browser.last_response.status).to eq(200)
		    end

		    it 'returns data sorted by color descending, then by surname' do
		    	expect(JSON.parse(browser.last_response.body)).to eq({"records"=>[{"first_name"=>"John","last_name"=>"Wayne","favorite_color"=>"Teal","birth_date"=>"2017-01-19"},{"first_name"=>"Claudia Jean","last_name"=>"Gregg","favorite_color"=>"Taupe","birth_date"=>"2017-01-22"},{"first_name"=>"Laura","last_name"=>"Moreno","favorite_color"=>"Blue","birth_date"=>"2017-01-17 "}]})
		    end
		end

		describe 'GET /v1/birthdate' do
			before(:each) { browser.get 'v1/birthdate' }
			it 'returns a 200 status code' do
		    	expect(browser.last_response.status).to eq(200)
		    end
		    it 'returns data sorted by birthdate' do
		    	expect(JSON.parse(browser.last_response.body)).to eq({"records"=>[{"first_name"=>"Laura","last_name"=>"Moreno","favorite_color"=>"Blue","birth_date"=>"2017-01-17 "},{"first_name"=>"John","last_name"=>"Wayne","favorite_color"=>"Teal","birth_date"=>"2017-01-19"},{"first_name"=>"Claudia Jean","last_name"=>"Gregg","favorite_color"=>"Taupe","birth_date"=>"2017-01-22"}]})
		    end
		end	

		describe 'GET /v1/surname' do
			before(:each) { browser.get 'v1/surname' }
			it 'returns a 200 status code' do
		    	expect(browser.last_response.status).to eq(200)
		    end
		    it 'returns data sorted by surname descending' do
		    	expect(JSON.parse(browser.last_response.body)).to eq({"records"=>[{"first_name"=>"John","last_name"=>"Wayne","favorite_color"=>"Teal","birth_date"=>"2017-01-19"},{"first_name"=>"Laura","last_name"=>"Moreno","favorite_color"=>"Blue","birth_date"=>"2017-01-17 "},{"first_name"=>"Claudia Jean","last_name"=>"Gregg","favorite_color"=>"Taupe","birth_date"=>"2017-01-22"}]})
		    end
		end	

	end
end
