class Chitter < Sinatra::Base
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
end
