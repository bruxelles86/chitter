class Chitter < Sinatra::Base
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
end
