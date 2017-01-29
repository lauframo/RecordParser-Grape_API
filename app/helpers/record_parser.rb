require 'csv'
require_relative '../models/person'
module RecordParser

  def self.parse_file(filename)
    output = []
    CSV.open(filename, 'r') do |csv|
      if csv.first[0].include? "|"
        CSV.foreach(filename, :headers => true, :col_sep => "|") do |row|
          new_row = (row.to_hash)
          output << Person.new(new_row)
        end
      else
         CSV.foreach(filename, :headers => true) do |row|
          new_row = (row.to_hash)
          output << Person.new(new_row)
        end
      end
    end
    output
  end

  def self.parse_string(string)
    output = []

  end

end


# p RecordParser.parse('database.csv')
# p RecordParser.parse("records.csv")
# p RecordParser.parse("records_pipe_delimited.csv")
