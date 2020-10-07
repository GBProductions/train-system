require('spec_helper')

describe('#City') do

  describe('#==') do
    it('returns true for two equal city instances') do
      city1 = City.new({name: 'Seattle', id: nil})
      city2 = City.new({name: 'Seattle', id: nil})
      expect(city1).to(eq(city2))
    end
  end

  describe('.all') do
    it('returns an empty array when there are no cities') do
      expect(City.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a city') do
      city1 = City.new({name: 'Seattle', id: nil})
      city1.save
      city2 = City.new({name: 'Portland', id: nil})
      city2.save
      expect(City.all).to(eq([city1, city2]))
    end
  end

  describe('.clear') do
    it("clears all cities") do
      city = City.new({:name => 'Seattle', :id => nil})
      city.save()
      city2 = City.new({:name => 'Portland', :id => nil})
      city2.save()
      City.clear
      expect(City.all).to(eq([]))
    end
  end

  describe('.find') do
    it('find a city by id') do
      city = City.new({name:'Seattle', id:nil})
      city.save()
      city2 = City.new({name:'Portland', id:nil})
      city2.save()
      expect(City.find(city.id)).to(eq(city))
    end
  end

  describe('#update') do
  it("updates a city by id") do
    city = City.new({:name => "Seattle", :id => nil})
    city.save()
    city.update("Yakima")
    expect(city.name).to(eq("Yakima"))
  end
end

  describe('#delete') do
    it('deletes a city') do
      city = City.new({:name => 'Seattle', :id => nil})
      city.save()
      city2 = City.new({:name => 'Portland', :id => nil})
      city2.save()
      city.delete
      expect(City.all).to(eq([city2]))
    end
  end

  # describe('#trains') do
  #   it('returns an array of all trains that stop in the given city') do
  #   end
  # end

end