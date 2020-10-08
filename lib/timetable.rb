class Timetable
  attr_reader :stops

  def initialize
    @stops = DB.exec("SELECT * from stops")
  end

  # def get_stops
  #    @stops = DB.exec("SELECT * from stops") # Array of hashes with, city, train, and a time, and id
  # end

  # Method to get the train name
  # Method to get actual city name
  # Method to get actual time

  def get_names
    array_of_names = []
    @stops.each do |row| 
      names = {}  # {city: name, train: name, time: time}
      names['city'] = DB.exec("SELECT name FROM cities WHERE id = #{row['city_id']};").first
      names['train'] = DB.exec("SELECT name FROM trains WHERE id = #{row['train_id']};").first
      names['time'] = row['time']
      array_of_names.push(names)
    end
    array_of_names
  end

end  