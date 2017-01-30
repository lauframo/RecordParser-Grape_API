require 'grape'

# module WestWing
	class API < Grape::API
	  version 'v1', using: :path
	  format :json

   # p RecordParser.parse_file('records.csv')
   #  @laura= Person.new({"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "green", "DateOfBirth"=> '2015-10-21' })
   #  @person = Person.new({"FirstName"=> "Jed", "LastName"=> "Barlett", "FavoriteColor"=> "navy", "DateOfBirth"=> '2015-10-20' })


  # post do
  #   person = Person.new(params)
  #   person.save
    

  # end

    get :color do
      { records: Person.hash_ouput(Person.sort_by_color) }
    end

    get :birthdate do
      { records: Person.hash_ouput(Person.sort_by_birthdate) }
    end

    get :surname do
      { records: Person.hash_ouput(Person.sort_by_birthdate) }
    end
 	end
# end