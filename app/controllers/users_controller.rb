# encoding: UTF-8
class UsersController < ApplicationController

def new
  if current_user
    redirect_to root_path, :notice => 'Привет, лентяй!'
  end 
  @user = User.new
end


def create
  @user = User.new(user_params)
  @user.admin = false
  if @user.save
     session[:user_id] = @user.id
     redirect_to impulsetreattypes_path, :notice => "Заполните импульсы/награды!"
  else
    render "new"
  end
end


def index
  if params[:search]
    @users = User.search(params[:search]).order("created_at DESC")
  else
    @users = User.limit(30).order("RANDOM()")
  end
end


def show
 if current_user
    @user = User.find(params[:id])
    @messages = Message.where(recipient_id: current_user.id).order('created_at DESC')
 else 
    redirect_to '/log_in'
 end
end


def edit
  @user = current_user
end


def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to @user
  else
    render 'edit'
  end
end


def current_admin
  current_user && current_user.admin
end


private
def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :randchance)
  end

end
