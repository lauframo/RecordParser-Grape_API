require 'csv'
require_relative 'person'

class Database
  COLUMN_HEADERS = ["LastName", "FirstName", "FavoriteColor", "DateOfBirth"]
  FILE_NAME = "database.csv"

  def initialize
    @database = CSV.open(FILE_NAME, "wb") { |csv| csv << COLUMN_HEADERS}
  end

  def add(person_object)
    raise "Not an instance of Person class" if person_object.class =! Person


  end
end


# p Database.new
