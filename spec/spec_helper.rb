(Dir['./app/models/*.rb'].sort + Dir['./app/helpers/*.rb'] + Dir['./app/api/v1/*.rb'] ).each do |file|
  require file
end
