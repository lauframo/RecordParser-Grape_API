# require_relative 'database'
require 'json'

class Person
  attr_reader :first_name, :last_name, :favorite_color, :birth_date

  def initialize(args)
    @first_name = args["FirstName"]
    @last_name = args["LastName"]
    @favorite_color = args["FavoriteColor"]
    @birth_date = args["DateOfBirth"]
  end

  def to_hash
    hash = {}
    self.instance_variables.each do |variable|
      hash[variable.to_s.delete("@")] = self.instance_variable_get(variable)
    end
    hash
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.sort_by_color
    self.all.sort do |a, b|
      [b.favorite_color.downcase, a.last_name.downcase] <=> [a.favorite_color.downcase, b.favorite_color.downcase]
    end
  end

  def self.sort_by_birthdate
    self.all.sort_by do |person|
      person.birth_date
    end
  end

  def self.sort_by_surname
    self.all.sort do |a, b|
      b.last_name <=> a.last_name
    end
  end

  def self.hash_ouput(collection)
    array = []
    collection.each { |instance| array << instance.to_hash }
    array
  end


  def save(database_object)
    database_object.add(self)
  end

end


# laura_args = {"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "cerulean", "DateOfBirth"=> '2017-01-23' }
# laura = Person.new(laura_args)
# # # p laura.to_hash
# # # hash = {}
# # # laura.instance_variables.each {|var| hash[var.to_s.delete("@")] = laura.instance_variable_get(var) }
# # # p hash
# # # p hash # => {"name"=>"book", "price"=>15.95}
# # # test = {:first_name => laura.first_name, :last_name=>laura.last_name}

# # # p test
# josh_args = { "FirstName"=> "Josh", "LastName"=> "Lyman", "FavoriteColor"=> "tan", "DateOfBirth"=> '2017-01-19' }
# josh = Person.new(josh_args)
# # p josh.to_json
# # # p josh.to_hash
# donna_args = { "FirstName"=> "Donna", "LastName"=> "Moss", "FavoriteColor"=> "amber", "DateOfBirth"=> '2016-02-25' }
# donna =  Person.new(donna_args)
# # # # # database = Database.new

# # people = []
# # Person.sort_by_surname.each {|person| people << person.to_hash }
# # p people
# p Person.hash_ouput(Person.sort_by_birthdate)
# # # p Person.sort_by_birthdate
# # # p Person.sort_by_surname




