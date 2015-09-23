# encoding: UTF-8
class TasksController < ApplicationController
  before_action :set_product, only: [:itsdone, :delay, :undelay, :edit, :update, :destroy, :tobox, :outofbox]

respond_to :html, :js

def index
 if current_user
   @tasks = current_user.tasks.where(done: false).where(longbox: false).order('actual desc, title, grade')
   @treats = Treat.joins(:impulse).where('user_id in (?)', current_user.id).where(done: false).order('created_at DESC')
   @impulses = Impulse.where(user_id: current_user.id).order('created_at DESC').limit(5)
   @impulsetypes = Impulsetreattype.where(small: true).where('user_id in (?)', current_user.id).where(erased: false).order('title')
 else
   redirect_to log_in_path
 end
end

def list
   @tasks = current_user.tasks.order('created_at DESC')
end

def create
  task = current_user.tasks.create(task_params)
  if task.grade == nil
    task.grade = 5
  end  
  if task.grade > 10
    task.grade = 10
  end
  r = Random.rand(171) + 1
  if r < 10
    task.icon = "00" + r.to_s
  else
    if r < 100
      task.icon = "0" + r.to_s
    else  
      task.icon = r.to_s
    end 
  end
  task.save
  respond_to do |format|
    format.html { redirect_to root_path, notice: 'Задача добавлена!' }
    format.js { render partial: 'taskslistrefresh'  }
  end

end


def itsdone
  @task.done = true
  @task.donedt = DateTime.now
  @task.save
  current_user.score += @task.grade
  current_user.save
  #redirect_to root_path
  respond_to do |format|
    format.js { render partial: 'taskslistrefresh'  }
    format.html { redirect_to root_path, notice: 'Задача побеждена!' }
  end
end

def delay
  @task.actual = false
  @task.save
  respond_to do |format|
    format.js { render partial: 'taskslistrefresh'  }
    format.html { redirect_to root_path, notice: 'Задача отложена.' }
  end
end

def undelay
  @task.actual = true
  @task.save
  respond_to do |format|
    format.js { render partial: 'taskslistrefresh'  }
    format.html { redirect_to root_path, notice: 'Задача актуализирована.' }
  end
end


def tobox
  @task.longbox = true
  @task.save
  respond_to do |format|
    format.js { render partial: 'taskslistrefresh'  }
    format.html { redirect_to root_path, notice: 'Задача отложена.' }
  end
end


def outofbox
  @task.longbox = false
  @task.save
  respond_to do |format|
    format.js { render partial: 'taskslistrefresh'  }
    format.html { redirect_to longbox_path, notice: 'Задача перенесена.' }
  end
end


def edit
  #@task = Task.find(params[:id])
end


def update
  if @task.update(task_params)
    redirect_to root_path
  else
    render 'edit'
  end
end

def destroy
  @task.destroy
  redirect_to root_path
  #respond_to do |format|
  #  format.js { render partial: 'taskslistrefresh'  }
  #end
end

def longbox
  @boxtasks = current_user.tasks.where(done: false).where(longbox: true).order('actual desc, title, grade')
end

private
    def set_product
      @task = Task.find(params[:id])
    end


def task_params
    params.require(:task).permit(:title, :description, :done, :grade, :icon, :actual, :longbox, :calendarity, :dt)
end


end
