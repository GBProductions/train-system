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
  end

  def self.all
    @@trains.values()
  end

  def save
    result = DB.exec("INSERT INTO trains (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.clear
    DB.exec("DELETE FROM trains *;")
  end

  def self.find(id)
    @@trains [id]
    @@total_rows = 0
  end

  def update(name)
    @name = name
    DB.exec("UPDATE trains SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM trains WHERE id = #{@id};")
  end

  def cities
    City.find_by_train(self.id)
  end

end


