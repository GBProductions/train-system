class Train
  attr_reader :id
  attr_accessor :name


  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def ==(train_to_compare)
    if train_to_compare != nil
      (self.name() == train_to_compare.name())
    else
      nil
    end
  end

  def self.all
    returned_trains = DB.exec("SELECT * FROM trains;")
    trains = []
    returned_trains.each() do |train|
      name = train.fetch("name")
      id = train.fetch("id").to_i()
      trains.push(Train.new({:name => name, :id => id}))
    end
    trains
  end

  def save
    result = DB.exec("INSERT INTO trains (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.clear
    DB.exec("DELETE FROM trains *;")
  end

  def self.find(id)
    train = DB.exec("SELECT * FROM trains WHERE id = #{id};").first()
    if train
      name = train.fetch("name")
      id = train.fetch("id").to_i
      Train.new({:name => name, :id => id})
    else
      nil
    end
  end

  def update(name)
    @name = name
    DB.exec("UPDATE trains SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM trains WHERE id = #{@id};")
  end

  def cities
    cities = []
    returned_city_ids = DB.exec("SELECT city_id FROM stops WHERE train_id = #{@id}") # Will give an array of city ids
    if returned_city_ids!= nil
      returned_city_ids.each do |city_id|
        id = city_id.to_i
        name = DB.exec("SELECT name from cities WHERE id = #{id};").first
        cities.push(City.new({name: name, id:id}))
      end
    end
    cities
  end

end