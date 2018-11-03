require 'pry'
require 'json'

require 'sinatra'
require 'sinatra/base'
require 'logger'

Dir.glob('./app/controllers/application_controller.rb').each { |file| require file }
Dir.glob('./app/controllers/main_controller.rb').each { |file| require file }

# map the controllers to routes
map('/hash') { run MainController }