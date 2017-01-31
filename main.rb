require './dependencies'
(Dir['./app/models/*.rb'].sort + Dir['./app/api/v1/*.rb'] + Dir['./app/helpers/*.rb'] + Dir['./app/controllers/*.rb'].sort).each do |file|
  require file
end

DATABASE = Database.new('database.csv')

