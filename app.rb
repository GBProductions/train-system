require('sinatra')
require('sinatra/reloader')
require('./lib/city')
require('./lib/train')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "train_database"})

get('/') do
  redirect to('/home')
end

get('/home') do
  erb(:home)
end

get('/trains') do
  @trains = Train.all
  erb(:trains)
end

get('/cities') do
  @cities = City.all
  erb(:cities)
end

get('/trains/new') do
  erb(:new_train)
end

get('/cities/new') do
  erb(:new_city)
end

post('/trains') do
  name = params[:train_name]
  train = Train.new({name: name, id: nil})
  train.save
  redirect to('/trains')
end

post('/cities') do
  name = params[:city_name]
  city = City.new({name: name, id: nil})
  city.save
  redirect to('/cities')
end

get('/trains/:id') do
  @trains = Train.find(params[:id].to_i())
  erb(:train)
end

get('/cities/:id') do
  @cities = City.find(params[:id].to_i())
  erb(:city)
end
