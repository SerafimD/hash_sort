require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sqlite3'
require './models.rb'
require 'json'
require 'logger'
require_relative 'app/middleware/catch_json_parse_errors'
require_relative 'app/controllers/application_controller'
require_relative 'app/controllers/behavior_controller'
require_relative 'app/controllers/tree_controller'

set :database, "sqlite3:database.sqlite3"
