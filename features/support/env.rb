ENV['RACK_ENV'] = 'test'

require File.joing(File.dirname(__FILE__), '..', '..', 'app/server.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = Chitter

class ChitterWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ChitterWorld.new
end
