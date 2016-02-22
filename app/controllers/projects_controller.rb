# encoding: UTF-8
class ProjectsController < ApplicationController

before_action :set_product, only: [:edit, :update, :destroy]

respond_to :html, :js


def create
  project = current_user.projects.create(project_params)
  if project.tip == nil
    project.tip = 1
  end  
  if project.tip > 6
    project.tip = 6
  end
  project.save
  redirect_to root_path, :notice => "Проект добавлен!"
end


def index
 if current_user
   @projects = current_user.projects.order('tip')
 else
   redirect_to log_in_path
 end
end


def edit
  @tasks = @project.tasks.where(done: false).order('tasks.grade')
end

def update
  if @project.update(project_params)
    redirect_to root_path
  else
    render 'edit'
  end
end

def destroy
  @project.destroy
  redirect_to root_path
  #respond_to do |format|
  #  format.js { render partial: 'taskslistrefresh'  }
  #end
end

private
def set_product
  @project = Project.find(params[:id])
end


def project_params
    params.require(:project).permit(:name, :tip, :user_id)
end


end
