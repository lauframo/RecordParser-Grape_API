##LastName, FirstName, FavoriteColor, DateOfBirth

require_relative '../person'

describe Person do
	let(:laura_args) { {"FirstName": "Laura", "LastName": "Moreno", "FavoriteColor": "cerulean", "DateOfBirth": '2017-01-23' } }
	let(:laura) { Person.new(laura_args)}

	context 'it has readeable attribuets' do

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

end

