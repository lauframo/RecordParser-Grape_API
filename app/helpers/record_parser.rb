require 'csv'

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
    if string.include? "|"
      string.prepend("LastName|FirstName|FavoriteColor|DateOfBirth\n")
      io_object = StringIO.new(string)
      csv_object = CSV.new(io_object, :headers => true, :col_sep => "|") 
    else
      string.prepend("LastName,FirstName,FavoriteColor,DateOfBirth\n")
      io_object = StringIO.new(string) 
      csv_object = CSV.new(io_object, :headers => true)
    end
    collection = csv_object.to_a.map {|row| row.to_hash if row.length > 1 }
    collection.each {|record| output << Person.new(record) if record != nil}
    output
  end

  def self.hash_output(collection)
    array = []
    collection.each { |instance| array << instance.to_hash }
    array
  end

end
