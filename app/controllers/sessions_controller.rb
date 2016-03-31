get '/sessions-helper' do
  session.inspect
end

get '/session/new' do
  erb :'/session/new'
end

post '/session' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Email/Password combination does not exist"]
    erb :'/session/new'
  end
end

delete '/session' do
  session.delete[:user_id]
  redirect '/questions'
end
