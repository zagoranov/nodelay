# encoding: UTF-8
class ImpulsesController < ApplicationController

respond_to :html, :js

def index
   @impulses = Impulse.where(user_id: current_user.id).order('created_at DESC')
end

def new
  @impulse = current_user.impulses.new()
end

def create
  impulse = current_user.impulses.create(impulse_params)
  if impulse.impulsetreattype != nil
    impulse.save
    current_user.score += 1
    current_user.save
    r = Random.rand(current_user.randchance) + 1
    if r == current_user.randchance #урра!!! награда!!!!
    	treat = impulse.treats.create()
      rr = Random.rand(18) + 1
      if rr < 10
        treat.icon = "0" + rr.to_s
      else
        treat.icon = rr.to_s
      end
  	  r = Random.rand(current_user.randchance * 2) + 1
  	  if r == current_user.randchance #урра!!! БОЛЬШАЯ награда!!!!
        type = Impulsetreattype.where(small: false).where(erased: false).where('user_id in (?)', current_user.id).order("RANDOM()").first
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
    #else
      #redirect_to root_path, :notice => 'Отлично, чувак!'
    end
  end   
  respond_to do |format|
    format.js { render partial: 'imptrlistrefresh' }
  end

end


private
  def impulse_params
    params.require(:impulse).permit(:user_id, :impulsetreattype_id)
  end


end
