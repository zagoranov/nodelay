# encoding: UTF-8
class ImpulsesController < ApplicationController

def new
  @impulse = current_user.impulses.new()
end

def create
  impulse = current_user.impulses.create(impulse_params)
  impulse.save
  current_user.score += 1
  current_user.save
  r = Random.rand(current_user.randchance) + 1
  if r == 4 #урра!!! награда!!!!
  	treat = impulse.treats.create()
  	r = Random.rand(current_user.randchance) + 1
  	if r == 4 #урра!!! БОЛЬШАЯ награда!!!!
  	  type = Impulsetreattype.where(small: false).where('user_id in (?)', current_user.id).order("RAND()").first
  	  if type
  	    treat.impulsetreattype = type
      else
      	treat.impulsetreattype = impulse.impulsetreattype
      end	
  	  treat.save
  	  redirect_to root_path, :notice => 'Ого! БОЛЬШАЯ награда!' 
  	else
      treat.impulsetreattype = impulse.impulsetreattype
  	  treat.save
  	  redirect_to root_path, :notice => 'Ого! Награда!' 
  	end  
  else
    redirect_to root_path, :notice => 'Отлично, чувак!'
  end  
end


private
  def impulse_params
    params.require(:impulse).permit(:user_id, :impulsetreattype_id)
  end


end
