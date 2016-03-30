get '/session/new' do
  erb :'/session/new'
end

post '/session' do
  @user = User.find_by(params[:user])
end
