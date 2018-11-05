require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sqlite3'
require './models.rb'
require 'json'
require 'logger'


# Dir.glob('./app/controllers/application_controller.rb').each { |file| require file }
require_relative 'app/controllers/application_controller'
require_relative 'app/controllers/behavior_controller'
require_relative 'app/controllers/tree_controller'

# Dir.glob('./app/controllers/tree_controller.rb').each { |file| require file }
# Dir.glob('./app/controllers/behavior_controller.rb').each { |file| require file }


set :database, "sqlite3:database.sqlite3"
db = SQLite3::Database.new 'database.sqlite3'
db.results_as_hash = true
