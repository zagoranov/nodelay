class UsersController < ApplicationController

def show
  if current_user
    @user = User.find(params[:id])
    @messages = nil
    if current_user != @user
      @messages = Message.where('(user_id = ? and recipient_id = ?) or (recipient_id = ? and user_id = ?)', current_user.id, @user.id, current_user.id, @user.id).order(:created_at)
    end  
  else 
    redirect_to '/log_in'
  end
end

end
