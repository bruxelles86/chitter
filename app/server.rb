require 'sinatra/base'
require 'sinatra/partial'
require 'data_mapper'
require 'rack-flash'
require './lib/user'
require './lib/email'
require_relative 'database'
require_relative './controllers/users'
require_relative './controllers/sessions'
require_relative './controllers/peep'
require_relative './helpers/helpers'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride
  use Rack::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  set :public_folder, Proc.new { File.join(root, "..", "..", "public") }
  set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    @posts = Post.all
    erb :index
  end

end
