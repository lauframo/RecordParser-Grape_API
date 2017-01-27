require './main'


class Web < Sinatra::Base
  get '/' do
    @person = Person.new({"FirstName"=> "Jed", "LastName"=> "Barlett", "FavoriteColor"=> "navy", "DateOfBirth"=> '2015-10-20' })
    p @person
    "yep"
  end
end


class People < Grape::API
  version 'v1', using: :path
  format :json

   RecordParser.parse('database.csv')
    @laura= Person.new({"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "green", "DateOfBirth"=> '2015-10-21' })
    @person = Person.new({"FirstName"=> "Jed", "LastName"=> "Barlett", "FavoriteColor"=> "navy", "DateOfBirth"=> '2015-10-20' })


  post do
    person = Person.new(params)
    person.save
    p

  end

  get :color do
    @collection = []
    @people =  Person.sort_by_color.each { |person| @collection << person.to_hash}
    { records: @collection}
  end

  get :birthdate do
    @collection = []
    @people =  Person.sort_by_birthdate.each { |person| @collection << person.to_hash}
    { records: @collection}
  end

  get :name do
    @collection = []
    @people =  Person.sort_by_surname.each { |person| @collection << person.to_hash}
    { records: @collection}
  end

end

run Rack::Cascade.new [People, Web]
