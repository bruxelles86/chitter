class Chitter < Sinatra::Base
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
end
