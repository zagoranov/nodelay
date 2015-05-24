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



def loadthatshit  #sql loading stuff
  if current_user #&& current_user.admin

     CONN.execute("update users set admin = true where name = 'romochka')

#    CONN.execute("delete from exercises where day_id in (select id from days where erased = true)")
#    CONN.execute("delete from trexercises where training_id in (select id from trainings where archived = true)")
#    CONN.execute("delete from trainings where archived = true")
    redirect_to root_path, :notice => "Ол райт!"
  end
end


end
