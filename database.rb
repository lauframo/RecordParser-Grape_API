require 'csv'
require_relative 'person'


class Database
    COLUMN_HEADERS = ["LastName", "FirstName", "FavoriteColor", "DateOfBirth"]
    FILE_NAME = "database.csv"

  def initialize
    @database = CSV.open(FILE_NAME, "wb") { |csv| csv << COLUMN_HEADERS}
  end

  def add(person_object)
    raise "Not an instance of Person class" if !person_object.kind_of?(Person)
    CSV.open(FILE_NAME, "a+") do |csv|
      csv << [ person_object.last_name, person_object.first_name, person_object.favorite_color, person_object.birth_date ]
    end
  end
end


laura_args = {"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "cerulean", "DateOfBirth"=> '2017-01-23' }
laura = Person.new(laura_args)
jed_args =  {"FirstName"=> "Jed", "LastName"=> "Barlett", "FavoriteColor"=> "navy", "DateOfBirth"=> '2015-10-20' }
jed = Person.new(jed_args)


p database = Database.new
p database.add(laura)
p database.add(jed)
