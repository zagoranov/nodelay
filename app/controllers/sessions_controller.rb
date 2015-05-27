# encoding: UTF-8
class SessionsController < ApplicationController

   CONN = ActiveRecord::Base.connection  #for sql_load

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



def load  #sql loading stuff
  if current_user && current_user.admin

     CONN.execute("delete from treats where impulsetreattype_id is null")
     CONN.execute("delete from impulses where impulsetreattype_id is null")
     CONN.execute("delete from treats where impulsetreattype_id is null")

    redirect_to root_path, :notice => "Ол райт!"
  end
end


end
