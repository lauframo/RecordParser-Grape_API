##LastName, FirstName, FavoriteColor, DateOfBirth


class Person
  attr_reader :first_name, :last_name, :favorite_color, :birth_date

  def initialize(args)
    @first_name = args["FirstName"]
    @last_name = args["LastName"]
    @favorite_color = args["FavoriteColor"]
    @birth_date = args["DateOfBirth"]
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
end


laura_args = {"FirstName"=> "Laura", "LastName"=> "Moreno", "FavoriteColor"=> "cerulean", "DateOfBirth"=> '2017-01-23' } 
laura = Person.new(laura_args)
josh_args = { "FirstName"=> "Josh", "LastName"=> "Lyman", "FavoriteColor"=> "tan", "DateOfBirth"=> '2017-01-19' } 
josh = Person.new(josh_args)
donna_args = { "FirstName"=> "Donna", "LastName"=> "Moss", "FavoriteColor"=> "amber", "DateOfBirth"=> '2016-02-25' } 
donna =  Person.new(donna_args)

p Person.all
p Person.sort_by_color
p Person.sort_by_birthdate
p Person.sort_by_surname
