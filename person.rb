##LastName, FirstName, FavoriteColor, DateOfBirth


class Person
  attr_reader :first_name, :last_name, :favorite_color, :birth_date

  def initialize(args)
    @first_name = args["FirstName"]
    @last_name = args["LastName"]
    @favorite_color = args["FavoriteColor"]
    @birth_date = args["DateOfBirth"]
  end

end