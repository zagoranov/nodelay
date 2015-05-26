class TasksController < ApplicationController

respond_to :html, :js

def index
 if current_user
   @tasks = current_user.tasks.where(done: false)
   @treats = Treat.joins(:impulse).where('user_id in (?)', current_user.id).where(done: false).order('created_at DESC')
   @impulses = Impulse.where(user_id: current_user.id).order('created_at DESC').limit(5)
   @impulsetypes = Impulsetreattype.where(small: true).where('user_id in (?)', current_user.id).where(erased: false)
 else
   redirect_to log_in_path
 end
end


def create
  task = current_user.tasks.create(task_params)
  task.save
  #redirect_to root_path
  respond_to do |format|
    format.js { render partial: 'taskslistrefresh'  }
  end
end


def itsdone
  task = Task.find(params[:id])
  task.done = true
  task.save
  current_user.score += task.grade
  current_user.save
  #redirect_to root_path
  respond_to do |format|
    format.js { render partial: 'taskslistrefresh'  }
  end
end

def edit
  @task = Task.find(params[:id])
end


def update
  @task = Task.find(params[:id])
  if @task.update(task_params)
    redirect_to root_path
  else
    render 'edit'
  end
end

def destroy
  task = Task.find(params[:id])
  task.destroy
  #redirect_to root_path
  respond_to do |format|
    format.js { render partial: 'taskslistrefresh'  }
  end
end



private
def task_params
    params.require(:task).permit(:title, :description, :done, :grade)
end


end
