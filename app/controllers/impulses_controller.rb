# encoding: UTF-8
class ImpulsesController < ApplicationController

respond_to :html, :js

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
      if Rails.env.production
        rnd = "random()"
      else
        rnd = "rand()"
      end  
      	  type = Impulsetreattype.where(small: false).where('user_id in (?)', current_user.id).order(rnd).first
  	  if type
  	    treat.impulsetreattype = type
      else
      	treat.impulsetreattype = impulse.impulsetreattype
      end	
  	  treat.save
  	  #redirect_to root_path, :notice => 'Ого! БОЛЬШАЯ награда!' 
  	else
      treat.impulsetreattype = impulse.impulsetreattype
  	  treat.save
  	  #redirect_to root_path, :notice => 'Ого! Награда!' 
  	end  
  else
    #redirect_to root_path, :notice => 'Отлично, чувак!'
  end
  respond_to do |format|
    # format.js { render partial: 'impulseslistrefresh' }
    format.js { render partial: 'imptrlistrefresh' }
  end
end


private
  def impulse_params
    params.require(:impulse).permit(:user_id, :impulsetreattype_id)
  end


end
