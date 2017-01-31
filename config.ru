require './main'


run Rack::Cascade.new [WestWing::API, Web]
