class SessionsController < ApplicationController

def new
end

def create
  user = User.new
  user.name = "Anonim"
  user.save
  session[:user_id] = user.id
  redirect_to posts_path, :notice => "Hello, " + user.name
end

def destroy
  session[:user_id] = nil
  redirect_to log_in_path
end

end
