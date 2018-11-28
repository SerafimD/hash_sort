ENV['RACK_ENV'] = 'test'
require 'rack/test'
require 'rake'
require_relative "../app/config/environment"
require 'rspec'
require 'database_cleaner'

module RSpecMixin
  include Rack::Test::Methods
  def app
    described_class
  end
end

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.before(:all) do
    # Rake::Task['db:test:prepare'].invoke
    DatabaseCleaner.clean
  end
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
