get '/login' do
  erb :login
end

post'/login' do
  @user = User.find_by(user_name: params[:user_name])
  if @user.password == params[:password_hash]
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors =@user.errors.full_messages
    erb :login
  end
end

post '/logout' do
  session.clear
  redirect '/login'
end
