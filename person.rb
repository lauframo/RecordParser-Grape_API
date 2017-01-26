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
    self.all.sort! do |a, b|
      a.favorite_color.downcase <=> b.favorite_color.downcase
  end

end
