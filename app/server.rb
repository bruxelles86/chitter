require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users/create' do
    params[:username]
    params[:email]
    params[:first_name]
    params[:last_name]
    # params[:passord]
    # params[:password_confirmation]
    erb :"users/create"
  end

end
