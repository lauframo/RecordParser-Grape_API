require_relative "../spec_helper"
require 'rack/test'

module WestWing
	describe API do
		def app
			WestWing::API
		end
		# before(:suite) { RecordParser.parse_file('api_records.csv')}
		let(:database) { Database.new('api_test.csv')}
		let(:browser) { Rack::Test::Session.new(Rack::MockSession.new(app)) }

		describe 'POST /v1' do
			let(:record) {{ "LastName" => "Moreno", "FirstName" => "Laura", "FavoriteColor" => "blue", "DateOfBirth" => "2017-01-17"}}

			context 'with valid data' do
				it 'returns a 201 status code' do
				 	browser.post '/v1', record
					expect(browser.last_response.status).to eq(201)
				end

				it 'returns the created record' do
					browser.post '/v1', record
					expect(JSON.parse(browser.last_response.body)).to eq({"first_name"=>"Laura", "last_name"=>"Moreno", "favorite_color"=>"blue", "birth_date"=>"2017-01-17"})
				end
			end
		
			context 'with invalid data' do 
				let(:record_params) { { "FirstName" => "Laura", "FavoriteColor" => "blue", "DateOfBirth" => "2010-11-08"} }
				it 'returns a 400 status code' do
				 	browser.post '/v1', record_params
					expect(browser.last_response.status).to eq(400)
				end

				it 'returns an error' do
					browser.post '/v1', record_params
					expect(JSON.parse(browser.last_response.body)).to eq({"error"=>"LastName is missing"})
				end
			end
		end


		describe 'GET /v1/color' do
			before(:each) { browser.get '/v1/color' }
			it 'returns a 200 status code' do
		    	expect(browser.last_response.status).to eq(200)
		    end

		    it 'returns data sorted by color descending, then by surname' do
		    	expect(JSON.parse(browser.last_response.body)).to eq({"records"=>[{"first_name"=>"John","last_name"=>"Wayne","favorite_color"=>"teal","birth_date"=>"2017-01-19"},{"first_name"=>"Claudia Jean","last_name"=>"Gregg","favorite_color"=>"taupe","birth_date"=>"2017-01-22"},{"first_name"=>"Laura","last_name"=>"Moreno","favorite_color"=>"blue","birth_date"=>"2017-01-17"},{"first_name"=>"Laura","last_name"=>"Moreno","favorite_color"=>"blue","birth_date"=>"2017-01-17"},{"first_name"=>"Laura","last_name"=>"Moreno","favorite_color"=>"blue","birth_date"=>"2017-01-17"}]})
		    end
		end

		describe 'GET /v1/birthdate' do
			before(:each) { browser.get 'v1/birthdate' }
			it 'returns a 200 status code' do
		    	expect(browser.last_response.status).to eq(200)
		    end
		    it 'returns data sorted by birthdate' do
		    	expect(JSON.parse(browser.last_response.body)).to eq({"records"=>[{"first_name"=>"Laura","last_name"=>"Moreno","favorite_color"=>"blue","birth_date"=>"2017-01-17"},{"first_name"=>"Laura","last_name"=>"Moreno","favorite_color"=>"blue","birth_date"=>"2017-01-17"},{"first_name"=>"Laura","last_name"=>"Moreno","favorite_color"=>"blue","birth_date"=>"2017-01-17"},{"first_name"=>"John","last_name"=>"Wayne","favorite_color"=>"teal","birth_date"=>"2017-01-19"},{"first_name"=>"Claudia Jean","last_name"=>"Gregg","favorite_color"=>"taupe","birth_date"=>"2017-01-22"}]})
		    end
		end	

		describe 'GET /v1/surname' do
			before(:each) { browser.get 'v1/surname' }
			it 'returns a 200 status code' do
		    	expect(browser.last_response.status).to eq(200)
		    end
		    it 'returns data sorted by surname descending' do
		    	expect(JSON.parse(browser.last_response.body)).to eq({"records"=>[{"first_name"=>"John","last_name"=>"Wayne","favorite_color"=>"teal","birth_date"=>"2017-01-19"},{"first_name"=>"Laura","last_name"=>"Moreno","favorite_color"=>"blue","birth_date"=>"2017-01-17"},{"first_name"=>"Laura","last_name"=>"Moreno","favorite_color"=>"blue","birth_date"=>"2017-01-17"},{"first_name"=>"Laura","last_name"=>"Moreno","favorite_color"=>"blue","birth_date"=>"2017-01-17"},{"first_name"=>"Claudia Jean","last_name"=>"Gregg","favorite_color"=>"taupe","birth_date"=>"2017-01-22"}]})
		    end
		end	

	end
end
