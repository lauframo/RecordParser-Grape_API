require 'grape'

module WestWing
  class API < Grape::API
    version 'v1', using: :path
    format :json

    @laura= Person.new({"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "green", "DateOfBirth"=> '2015-10-21' })
    @person = Person.new({"FirstName"=> "Jed", "LastName"=> "Barlett", "FavoriteColor"=> "navy", "DateOfBirth"=> '2015-10-20' })

  params do
    requires :LastName, type: String
    requires :FirstName, type: String
    requires :FavoriteColor, type: String
    requires :DateOfBirth, type: String
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
      { records: Person.hash_ouput(Person.sort_by_birthdate) }
    end
 	end
end