require './dependencies'
# (Dir['./app/models/*.rb'].sort + Dir['./app/api/*.rb'] + Dir['./app/routes/*.rb'].sort).each do |file|
(Dir['./app/models/*.rb'].sort + Dir['./app/api/*.rb']).each do |file|
  require file
end
