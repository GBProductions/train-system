require('sinatra')
require('sinatra/reloader')
require('./lib/city')
require('./lib/train')
require('./lib/timetable')
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

get('/timetable') do
  @timetable = Timetable.new
  # @timetable.get_stops
  erb(:timetable)
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
  @train = Train.find(params[:id].to_i())
  erb(:train)
end

get('/cities/:id') do
  @city = City.find(params[:id].to_i())
  erb(:city)
end

get('/trains/:id/edit') do
  @train = Train.find(params[:id].to_i())
  erb(:edit_train)
end

get('/cities/:id/edit') do
  @city = City.find(params[:id].to_i())
  erb(:edit_city)
end

patch('/cities/:id') do
  @city = City.find(params[:id].to_i)
  if params[:city_name]
    @city.update({name: params[:city_name]})
  elsif params[:train_name]  
    @city.update({train_name: params[:train_name]})
  end
  redirect to ('/cities')
end

patch('/trains/:id') do
  @train = Train.find(params[:id].to_i)
  if params[:train_name]
    @train.update({name: params[:train_name]})
  elsif params[:city_name] && [:time]
    @train.update({city_name: params[:city_name], time: params[:time]})
  end
  redirect to ('/trains')
end

delete('/cities/:id') do
  @city = City.find(params[:id].to_i)
  @city.delete
  redirect to ('/cities')
end

delete('/trains/:id') do
  @train = Train.find(params[:id].to_i)
  @train.delete
  redirect to ('/trains')
end

