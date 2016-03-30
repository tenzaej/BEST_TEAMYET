helpers do

  def author?(post)
    current_user.id == post.user_id
  end

  def logged_in?
    session[:user_id]
  end

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def redirect_login
    if !logged_in?
      redirect '/users/new'
    end
  end
end
