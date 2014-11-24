require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

require './lib/user'
require './lib/email'
require_relative 'database'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  use Rack::MethodOverride
  use Rack::Flash

  set :public, Proc.new { File.join(root, "..", "public") }

  get '/' do
    @posts = Post.all
    erb :index
  end

  post '/peep' do
    time = Time.now
    post = Post.create(user: current_user, text: params[:post_text], time: time)
    if post
      flash[:notice] = "Nice one!"
      redirect('/')
    else
      flash[:error] = "Sorry, there seems to have been some sort of problem..."
      redirect('/')
    end
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

  get '/users/password/reset' do
    erb :"users/password/reset"
  end

  post '/users/password/reset' do
    username = params[:username]
    user = User.first(username: username)
    email = user.email
    token = user.generate_token
    timestamp = user.generate_timestamp
    user.update(password_token: token, password_timestamp: timestamp)
    Email.password_reset(email, token)
    flash[:notice] = "Thanks! Please check your email for more instructions"
    redirect('/')
  end

  get '/users/password/reset/:token' do
    token = params[:token]
    @user = User.first(password_token: token)
    if time_is_under_one_hour
      @user.update(password_token: nil, password_timestamp: nil)
      erb :"users/password/new"
    else
      flash[:errors] = "Sorry, your code is out of date, please try again"
      redirect to('/users/password/reset')
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

  delete '/sessions' do
    session.clear
    flash[:notice] = "Good bye! See you again soon"
    redirect to('/')
  end

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end

    def time_is_under_one_hour
      (Time.now.to_i - @user.password_timestamp.to_i) < 3600
    end
  end

end
