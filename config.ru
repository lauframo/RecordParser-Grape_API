require './main'

RecordParser.parse_file('database.csv')


run Rack::Cascade.new [WestWing::API, Web]
