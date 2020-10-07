require('spec_helper')

describe('#City') do

  describe('#==') do
    it('return true for two equal city instances') do
      city1 = City.new({name: 'Seattle', id: nil})
      city2 = City.new({name: 'Seattle', id: nil})
      expect(city1).to(eq(city2))
    end
  end

  # describe('.all') do
  #   it('return an empty array when there are no cities') do
      
  #   end
  # end

  # describe('#save') do
  #   it('save a city') do
      
  #   end
  # end

  # describe('.clear') do
  #   it('clear all cities') do
      
  #   end
  # end

  # describe('.find') do
  #   it('find a city by id') do
      
  #   end
  # end

  # describe('#update') do
  #   it('update the name of a city by id') do
      
  #   end
  # end

  # describe('#delete') do
  #   it('delete a city') do
      
  #   end
  # end

  # describe('#trains') do
  #   it('return an array of all trains that stop in the given city') do
      
  #   end
  # end



end