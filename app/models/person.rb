require_relative 'database'

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





