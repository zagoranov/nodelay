# encoding: UTF-8
class EnvirosController < ApplicationController

respond_to :html, :js


def index
  if current_user  
      @envs = current_user.enviros.order('enviros.dt desc')
 else 
  redirect_to '/log_in'
 end
end


def add
  env = current_user.enviros.create(env_params)
  env.dt = DateTime.now
  env.save
  respond_to do |format|
    format.js 
    format.html { redirect_to enviros_path }
  end
end

private
  def env_params
    params.require(:enviro).permit(:hum, :temp, :user_id)
  end



end
