(Dir['./app/models/*.rb'].sort + Dir['./app/helpers/*.rb']).each do |file|
  require file
end
