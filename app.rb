require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'json'
require 'logger'
require 'reportage'

require_relative "app/config/environment"
require_relative 'app/models/behaviors'
require_relative 'app/services/sort_tree_service'
require_relative 'app/middleware/parse_errors_middleware'
require_relative 'app/controllers/application_controller'
require_relative 'app/controllers/tree_controller'
require_relative 'app/controllers/behavior_controller'
