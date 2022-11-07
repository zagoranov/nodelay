# encoding: UTF-8
class ProjectsController < ApplicationController

before_action :set_product, only: [:edit, :update, :destroy]

respond_to :html, :js


def create
  project = current_user.projects.create(project_params)
  project.save
  redirect_to projects_path, :notice => "Проект добавлен!"
end


def index
 if current_user
   @projects = current_user.projects.order('projecttip_id, created_at')
 else
   redirect_to log_in_path
 end
end


def edit
  @tasks = @project.tasks.where(done: false).order('tasks.tasktip_id')
end

def update
  if @project.update(project_params)
    redirect_to projects_path
  else
    render 'edit'
  end
end

def destroy
  @project.destroy
  redirect_to projects_path
  #respond_to do |format|
  #  format.js { render partial: 'taskslistrefresh'  }
  #end
end

private
def set_product
  @project = Project.find(params[:id])
end


def project_params
    params.require(:project).permit(:name, :projecttip_id, :description, :hideincalend)
end


end
