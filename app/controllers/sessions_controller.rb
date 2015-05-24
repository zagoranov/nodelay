# encoding: UTF-8
class SessionsController < ApplicationController

def new
  if current_user
    redirect_to root_path, :notice => 'Привет, лентяй!'
  end 
end

def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect_to root_path, :notice => "Добро пожаловать!"
  else
    flash.now.alert = "Ошибка какая-то!"
    render "new"
  end
end


def destroy
  session[:user_id] = nil
  redirect_to log_in_path
end

end
