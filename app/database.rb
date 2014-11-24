require 'data_mapper'

require './lib/user'
require './lib/post'
require './lib/email'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!
