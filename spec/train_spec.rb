require('spec_helper')

describe('#Train') do

  describe('#==') do
    it('returns true for two equal city instances') do
      train1 = Train.new({name: 'Green', id: nil})
      train2 = Train.new({name: 'Green', id: nil})
      expect(train1).to(eq(train2))
    end
  end

  describe('.all') do
    it('returns an empty array when there are no trains') do
      expect(Train.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a train') do
      train1 = Train.new({name: 'Green', id: nil})
      train1.save
      train2 = Train.new({name: 'Red', id: nil})
      train2.save
      expect(Train.all).to(eq([train1, train2]))
    end
  end
  
  describe('.clear') do
    it("clears all trains") do
      train = Train.new({:name => 'Green', :id => nil})
      train.save()
      train2 = City.new({:name => 'Red', :id => nil})
      train2.save()
      Train.clear
      expect(Train.all).to(eq([]))
    end
  end

  describe('.find') do
    it('find a train by id') do
      train = Train.new({name:'Green', id:nil})
      train.save()
      train2 = Train.new({name:'Yellow', id:nil})
      train2.save()
      expect(Train.find(train.id)).to(eq(train))
    end
  end
  
  describe('#update') do
    it("updates a train by id") do
      train = Train.new({:name => "Green", :id => nil})
      train.save()
      train.update({name: "Red"})
      expect(train.name).to(eq("Red"))
    end
  end

  describe('#update') do
    it("adds a city to a train in the stop table") do
      train = Train.new({:name => "Green", :id => nil})
      train.save()
      city = City.new({name: 'Portland', id: nil})
      city.save
      train.update({city_name: "Portland"})
      expect(train.cities).to(eq([city]))
    end
  end

  describe('#delete') do
    it('deletes a train') do
      train = Train.new({:name => 'Green', :id => nil})
      train.save()
      train2 = Train.new({:name => 'Red', :id => nil})
      train2.save()
      train.delete
      expect(Train.all).to(eq([train2]))
    end
  end

  # describe('#cities') do
  #   it('returns an array of all cities that a given trains stops in') do
  #   end
  # end
  
end