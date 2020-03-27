# frozen_string_literal: true

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logout
    session[:user_id] = nil
  end
end

#### HOMEPAGE route

# "listen" for a GET request to "/" (homepage)
get '/' do
  # grab the posts from the database
  @finstagram_posts = FinstagramPost.order(created_at: :desc)

  # render the .erb file in /views named "index.erb"
  return erb(:index)
end

###### SIGNUP route

get '/signup' do
  # make an empty user object
  # make it an @instance variable to pass it to the view
  @user = User.new
  # render views/signup.erb
  return erb(:signup)
end

post '/signup' do
  # grab user input values from url params
  # e.g. website.com/stuff?email=hi@hi.com&password=secrets
  my_email = params[:email]
  my_avatar_url = params[:avatar_url]
  my_username_value = params[:username]
  my_password = params[:password]

  # instantiate and save a User
  @user = User.new({ email: my_email, avatar_url: my_avatar_url, username: my_username_value, password: my_password })

  # (try to) save the user (checks the validation)
  did_user_save = @user.save

  if did_user_save
    # return readable representation of User object
    redirect to('/')
  else
    # go back to the signup page with the new @user
    return erb(:signup)
  end
end

###### LOGIN route

get '/login' do
  # show the login form
  return erb(:login)
end

# accept login requests
post '/login' do
  # grab the data from the request
  # (it comes through the url params hash)
  username = params[:username]
  password = params[:password]

  # 1. find user by username
  # pass it into the view using "@"
  @user = User.find_by(username: username)

  # 2. if that user exists
  # AND if that user's password matches the password input
  if @user && @user.password == password
    # save the user id in the server's session
    session[:user_id] = @user.id
    # return "Success! User with id #{session[:user_id]} is logged in!"
    redirect to '/'
  else
    @error_message = 'Login failed.'
    erb(:login)
  end
end

######## LOGOUT route

get '/logout' do
  logout
  redirect to '/'
end

######### POSTS route

# form for creating a new post
get '/finstagram_posts/new' do
  redirect to('/login') unless current_user

  # create an empty post to clear the error messages
  @finstagram_post = FinstagramPost.new
  erb(:"finstagram_posts/new")
end

# POST request listener for creating a new post
post '/finstagram_posts' do
  photo_url = params[:photo_url]

  # create a new post
  @finstagram_post = FinstagramPost.new({ photo_url: photo_url, user_id: current_user.id })

  # if it's valid, save it
  redirect to('/') if @finstagram_post.save

  # if it doesn't validate, print error messages
  return erb(:"finstagram_posts/new")
end

# get a single post
get '/finstagram_posts/:id' do
  @finstagram_post = FinstagramPost.find(params[:id]) # find the finstagram post with the ID from the URL
  erb(:"finstagram_posts/show") # render app/views/finstagram_posts/show.erb
end
