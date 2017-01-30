require './main'

run Rack::Cascade.new [People, Web]
