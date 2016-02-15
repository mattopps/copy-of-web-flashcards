get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(user_name: params[:user_name], first_name: params[:first_name], last_name: params[:last_name])
  @user.password = params[:password]
  @user.save
  session[:user_id] = @user.id
  redirect "/users/#{@user.id}"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

get '/users/:id/edit' do
  # @user = User.find(id: params[:id])
  # redirect '/login' unless logged_in? && params[:id].to_i == @user.id
  erb :'users/edit'
end

put '/users/:id' do
  @user = User.find_by(user_name: params[:user_name])
  @user.update(user_name: params[:user_name], password: params[:password], first_name: params[:first_name], last_name: params[:last_name])
  redirect "/users/#{user.id}"
end

delete '/users/:id' do
  user = User.find_by(user_name: params[:user_name])
  user.destroy
  redirect '/users/new'
end



