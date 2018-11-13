require "./app"
require "rspec/core/rake_task"
set :database_file, "app/config/database.yml"
require "sinatra/activerecord/rake"
RSpec::Core::RakeTask.new(:spec)

task :default => :spec
