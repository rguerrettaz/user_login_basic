get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.authenticate(params[:post])
  puts "*" * 20
  puts @user
  if @user
    session[:user] = @user.id
    puts session[:user]
    redirect '/' + @user.secret_page
  else
    @error = "incorrect info"
  end

  @error
  erb :login
end

get '/create' do
  erb :create
end

get '/:secret_page' do
  if session[:user] 
    erb :secret_page
  else
    @error = "Not today, Mr. Bond."
    erb :login
  end
end

post '/create' do
  User.create(params[:post])
end

post '/logout' do
  session.clear
  redirect '/login'
end

def check_session
  session[:user]
end
