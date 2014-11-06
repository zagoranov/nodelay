class MessagesController < ApplicationController

def create
  message = current_user.messages.create(mess_params)
  message.save
  redirect_to :back
end


private
def mess_params
    params.require(:message).permit(:recipient_id, :text)
  end


end
