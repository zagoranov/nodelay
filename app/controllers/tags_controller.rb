# encoding: UTF-8
class TagsController < ApplicationController

respond_to :html, :js


def create 
  task = Task.find_by_id(params[:task_id]) 
  if task != nil
    tag = task.tags.create(tag_params)
    tag.save
  end
  redirect_to :back
end


def index
  if current_user  
    if params[:search]
      @tags = Tag.search(params[:search])
    else
      @tags = Tag.limit(30).order("RANDOM()")
    end
 else 
  redirect_to '/log_in'
 end
end


def destroy
  tag = Tag.find_by_id(params[:id]) 
  if tag != nil
    tag.destroy
  end
  redirect_to :back
  #respond_to do |format|
  #  format.js { render partial: 'taskslistrefresh'  }
  #end
end



def tag_params
    params.require(:tag).permit(:name)
end


end
