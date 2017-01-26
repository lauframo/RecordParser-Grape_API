##LastName, FirstName, FavoriteColor, DateOfBirth

require_relative '../person'

describe Person do
  let(:laura_args) { {"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "cerulean", "DateOfBirth"=> '2017-01-23' } }
  let(:laura) { Person.new(laura_args)}
  # let(:josh_args) { { "FirstName"=> "Josh", "LastName"=> "Lyman", "FavoriteColor"=> "tan", "DateOfBirth"=> '2017-01-21' } }
  # let(:josh) { Person.new(josh_args)}
  # let(:donna_args) { { "FirstName"=> "Josh", "LastName"=> "Lyman", "FavoriteColor"=> "tan", "DateOfBirth"=> '2017-01-21' } }
  # let(:donna) { Person.new(donna_args)}

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

  context 'it sorts by desired attribute' do

    it 'sorts by favorite color descending, then by last name ascending' do
    end

    it 'sorts by birth date ascending' do
    end

    it 'sorts by last name descending' do
    end

  end



  end
