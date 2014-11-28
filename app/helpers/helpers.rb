class Chitter < Sinatra::Base
  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end

    def time_is_under_one_hour
      (Time.now.to_i - @user.password_timestamp.to_i) < 3600
    end
  end
end
