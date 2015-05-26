# encoding: UTF-8
class ImpulsetreattypesController < ApplicationController


def create
  imptt = current_user.impulsetreattypes.create(impulsetreattype_params)
  imptt.save
  redirect_to impulsetreattypes_path
end

def index
 if current_user  
    @imptts = Impulsetreattype.where('user_id in (?)', current_user.id)  
 else
    redirect_to log_in_path
 end  
end


def edit
  @imp = Impulsetreattype.find(params[:id])
end


def update
  @imp = Impulsetreattype.find(params[:id])
  if @imp.update(impulsetreattype_params)
    redirect_to impulsetreattypes_path
  else
    render 'edit'
  end
end


def destroy
  imp = Impulsetreattype.find(params[:id])
  imp.destroy
  redirect_to impulsetreattypes_path
end

private
  def impulsetreattype_params
    params.require(:impulsetreattype).permit(:title, :description, :small, :user_id)
  end

end
