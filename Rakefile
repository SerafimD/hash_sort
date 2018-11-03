require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:rspec)

task :default => :rspec

namespace :dev do
  desc 'Build all examples'
  task :render_all_examples do
    ruby File.expand_path(File.dirname(__FILE__) + '/examples/generator_example.rb')
  end

end