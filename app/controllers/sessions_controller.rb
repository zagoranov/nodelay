# encoding: UTF-8
class SessionsController < ApplicationController

   CONN = ActiveRecord::Base.connection  #for sql_load

def new
  if current_user
    redirect_to root_path, :notice => 'Привет, ленивец!'
  end 
  @backimage = "nodoshit.jpg"
end

def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect_to root_path, :notice => "И снова здравствуйте!"
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

     #Task.all.where(done: true).each do |imptt|
     #  imptt.donedt = DateTime.now
     #  imptt.save
     #end
     #Treat.all.where(done: true).each do |imptt|
     #  imptt.donedt = DateTime.now
     #  imptt.save
     #end
     
     Project.all do |pr|
        pr.projecttip_id = 1
     end

     Task.all do |pr|
        pr.tasktip_id = 1
     end

     #CONN.execute("insert into tasktips (name) values (\"Низкий\")")
     #CONN.execute("insert into projecttips (name) values(\"Текущие дела\")"
     #CONN.execute("update tasks set tasktip_id = 1")  
     #CONN.execute("update projects set projecttip_id = 1")  
     #CONN.execute("delete from treats where impulsetreattype_id is null")
     #CONN.execute("delete from impulses where impulsetreattype_id is null")
     #CONN.execute("delete from treats where impulsetreattype_id is null")


    redirect_to root_path, :notice => "Ол райт!"
  end
end


end
