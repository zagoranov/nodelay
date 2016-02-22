# encoding: UTF-8
class TagsController < ApplicationController

respond_to :html, :js


def create 
  task = Task.find(params[:task_id]) 
  tag = task.tags.create(tag_params)
  tag.save
  redirect_to :back
end


def index
 if current_user
   @tags = current_user.tags.order('created_at')
 else
   redirect_to log_in_path
 end
end


def destroy
  tag = Tag.find(params[:id]) 
  tag.destroy
  redirect_to :back
  #respond_to do |format|
  #  format.js { render partial: 'taskslistrefresh'  }
  #end
end



def tag_params
    params.require(:tag).permit(:name)
end


end
