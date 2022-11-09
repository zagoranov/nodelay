# encoding: UTF-8
class SessionsController < ApplicationController

   CONN = ActiveRecord::Base.connection  #for sql_load

def new
  if current_user
    redirect_to root_path, :notice => 'Привет, ленивец!'
  end 
  #@backimage = "nodoshit.jpg"
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

  current_user.admin = true
  current_user.save

  if current_user && current_user.admin

     #Task.all.where(done: true).each do |imptt|
     #  imptt.donedt = DateTime.now
     #  imptt.save
     #end
     #Treat.all.where(done: true).each do |imptt|
     #  imptt.donedt = DateTime.now
     #  imptt.save
     #end
     
     #Project.all do |pr|
     #   pr.projecttip_id = 1
     #   pr.save
     #end

     #Task.all do |pr|
     #   pr.tasktip_id = 1
     #   pr.save
     #end

     #CONN.execute("update projects set projecttip_id = 1")  
     #CONN.execute("delete from treats where impulsetreattype_id is null")

    #CONN.execute("delete from tasktips")
    #CONN.execute("insert into tasktips (name) values (\"Низкий\")")
    #CONN.execute("insert into tasktips (name) values (\"Средний\")")
    #CONN.execute("insert into tasktips (name) values (\"Высокий\")")

    #CONN.execute("delete from projecttips")
    #CONN.execute("insert into projecttips (name) values (\"Текущие дела\")")
    #CONN.execute("insert into projecttips (name) values (\"Текущие проекты\")")
    #CONN.execute("insert into projecttips (name) values (\"Areas of responsibilty\")")
    #CONN.execute("insert into projecttips (name) values (\"1-2 year goals\")")
    #CONN.execute("insert into projecttips (name) values (\"3-5 year goals\")")
    #CONN.execute("insert into projecttips (name) values (\"Life\")")

    CONN.execute("delete from tasks where done = true")

    redirect_to root_path, :notice => "Ол райт!"
  end
end


def gethumidity
  @env = Enviro.last
  if !@env
    @env = Enviro.new
    @env.humidity = 40
    @env.temperature = 20
    @env.co2 = 100
    @env.light = 1
    @env.dt = DateTime.now
    @env.save
  end
end

def sendatelegram
  pontificate(params[:mess])
  redirect_to '/gethumidity', notice: 'Данные записаны!'
end


def sethumidity
  #  params[:hum]  params[:temp]    /sethumidity?hum=43&temp=23
  @env = Enviro.last
  @env.humidity = params[:hum]
  @env.temperature = params[:temp]
  @env.co2 = params[:co2]
  @env.light = params[:light]
  @env.dt = DateTime.now
  @env.save
  redirect_to '/gethumidity', notice: 'Данные записаны!'
end

end
