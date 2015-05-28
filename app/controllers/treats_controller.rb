# encoding: UTF-8
class TreatsController < ApplicationController

respond_to :html, :js

def index
   @treats = Treat.joins(:impulse).where('user_id in (?)', current_user.id).order('created_at DESC')
end


def eatit
  treat = Treat.find(params[:id])
  treat.done = true
  treat.save
  #redirect_to root_path
  respond_to do |format|
    format.js { render partial: 'impulses/treatslistrefresh'  }
  end
end

end