ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app/server.rb')

require 'capybara'
require 'capybara/cucumber'
require 'data_mapper'
require 'database_cleaner'
require 'database_cleaner/cucumber'
require 'rspec'
require 'timecop'

DatabaseCleaner.strategy = :transaction

require_relative '../../app/database.rb'

Capybara.app = Chitter

class ChitterWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ChitterWorld.new
end


Before do
  DatabaseCleaner.start
end

After do |scenario|
  DatabaseCleaner.clean
end
