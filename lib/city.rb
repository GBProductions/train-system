class City
  attr_reader :id
  attr_accessor :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def ==(other_city)
    self.name == other_city.name
  end

  def self.all
    returned_cities = DB.exec("SELECT * FROM cities;")
    cities = []
    returned_cities.each do |city|
      name = city.fetch('name')
      id = city.fetch('id').to_i
      cities.push(City.new{name:name, id:id})
    end
  end

  def save

  end

  def self.clear

  end

  def self.find()

  end

  def update(name)

  end

  def delete

  end

  def trains

  end

end