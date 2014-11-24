require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

require './lib/user'
require_relative 'database'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'


  use Rack::Flash

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :"users/new"
  end

  post '/users/create' do
    @user = User.new(username: params[:username],
                     email: params[:email],
                     first_name: params[:first_name],
                     last_name: params[:last_name],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Chitter #{current_user.first_name}"
      redirect('/')
    else
      flash[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end

  post '/sessions' do
    username = params[:username]
    password = params[:password]
    user = User.authenticate(username, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = "Sorry, your email or password was incorrect. Please try again."
      erb :"sessions/new"
    end
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end
  end

end
