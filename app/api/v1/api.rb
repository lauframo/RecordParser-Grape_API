require_relative '../../helpers/record_parser.rb'

# p Person.all
require 'grape'

module WestWing
  class API < Grape::API
    version 'v1', using: :path
    format :json
    
    @record = RecordParser.parse_file('records.csv')
    # @record.each { |record| record.save(DATABASE) }
  # p Person.all
    
  params do
    requires :LastName, type: String
    requires :FirstName, type: String
    requires :FavoriteColor, type: String
    requires :DateOfBirth, type: String
    optional :string_record, type: String
  end


  post do
    record = Person.new(params)
    record.save(DATABASE)
  end

    get :color do
      { records: Person.hash_ouput(Person.sort_by_color) }
    end

    get :birthdate do
      { records: Person.hash_ouput(Person.sort_by_birthdate) }
    end

    get :surname do
      { records: Person.hash_ouput(Person.sort_by_surname) }
    end
 	end
end