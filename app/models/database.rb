require 'csv'


class Database
  COLUMN_HEADERS = ["LastName", "FirstName", "FavoriteColor", "DateOfBirth"]
    # FILE_NAME = "database.csv"
  attr_reader :file_name

  class NoPersonError < StandardError
  end

  def initialize(filename)
    @file_name = filename
    @database = CSV.open(filename, "wb") { |csv| csv << COLUMN_HEADERS}
  end

  def add(record)
    raise NoPersonError, "Not an instance of Person class" unless record.kind_of?(Person)
    CSV.open(self.file_name, "a+") do |csv|
      csv << [ record.last_name, record.first_name, record.favorite_color, record.birth_date ]
    end
  end
end


# laura_args = {"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "cerulean", "DateOfBirth"=> '2017-01-23' }
# laura = Person.new(laura_args)
# jed_args =  {"FirstName"=> "Jed", "LastName"=> "Barlett", "FavoriteColor"=> "navy", "DateOfBirth"=> '2015-10-20' }
# jed = Person.new(jed_args)


# p database = Database.new('test.csv')
# # p database.name
# # p database.add(laura)
# p database.add(jed)
