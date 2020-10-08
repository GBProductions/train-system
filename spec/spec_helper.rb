require 'rspec'
require 'pg'
require 'train'
require 'city'
require 'timetable'
require 'pry'

DB = PG.connect({:dbname => 'train_database_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM trains *;')
    DB.exec('DELETE FROM cities *;')
  end
end