ENV['RACK_ENV'] = 'test'
require_relative "../app/config/environment"
require 'rake'
require 'json'
require 'rspec'
require 'rack/test'
require 'database_cleaner'
require 'sinatra'
require 'sinatra/activerecord'
require 'pry'

require_relative '../app/models/behaviors'
require_relative '../app/middleware/parse_errors_middleware'
require_relative '../app/controllers/application_controller'
require_relative '../app/controllers/tree_controller'
require_relative '../app/services/sort_tree_service'

module RSpecMixin
  include Rack::Test::Methods
  def app
    described_class
  end
end

DatabaseCleaner.strategy = :truncation
ActiveRecord::Migration.maintain_test_schema!
RSpec.configure do |config|
  # config.before(:all) do
  #   DatabaseCleaner.clean
  # end
  config.after(:each) do
    DatabaseCleaner.clean
  end
  config.include RSpecMixin
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
