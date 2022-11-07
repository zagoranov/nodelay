# encoding: UTF-8
class UsersController < ApplicationController


def new
  if current_user
    redirect_to root_path, :notice => 'Привет, прокрастинатор!'
  end 
  @user = User.new
  @backimage = "nodoshit.jpg"
end


def create
  @user = User.new(user_params)
  @user.admin = false
  if @user.save
     session[:user_id] = @user.id
     #UserMailer.newreg_email(@user).deliver    #mail notification
     pontificate("New+User+on+NoDelay+" + @user.name)                         #telegram notification
     redirect_to impulsetreattypes_path, :notice => "Всё готово!"
  else
    render "new"
  end
end


def index
  if current_user  
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.limit(30).order("RANDOM()")
    end
 else 
  redirect_to '/log_in'
 end
end


def show
 if current_user
    @user = User.find(params[:id])
 else 
    redirect_to '/log_in'
 end
end


def edit
  if current_user
    @user = current_user
  else 
    redirect_to '/log_in'
  end
end


def update
  if current_user  
  @user = current_user
  if @user.update(user_params)
    redirect_to @user
  else
    render 'edit'
  end
 else 
    redirect_to '/log_in'
 end
end

def destroy
  user = User.find(params[:id])
  user.destroy
  redirect_to users_path
end



def current_admin
  current_user && current_user.admin
end


private
def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :schedule_url, :schedules)
  end

end
