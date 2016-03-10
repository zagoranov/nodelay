# encoding: UTF-8
class TasksController < ApplicationController

before_action :set_product, only: [:itsdone, :undone, :delay, :undelay, :edit, :update, :destroy]
  
respond_to :html, :js

def gtd
  if current_user  
    if Rails.env.production? 
      date_str = 'tasks.dt::date <= current_date'
      date_str2 = 'tasks.dt::date = current_date + 1'
    else
      date_str = 'Date(tasks.dt) <= Date(\'now\')'
      date_str2 = 'Date(tasks.dt) = Date(\'now\', \'+1 day\')'
    end
    @caltoday = Task.select('tasks.*').joins(:project).where('projects.user_id = ? and projects.done = ? and tasks.done = ? and tasks.actual = ? and tasks.calendarity = ? and ' + date_str, current_user.id, false, false, true, true).order('tasks.dt, tasks.tasktip_id desc')
    @caltomorrow = Task.select('tasks.*').joins(:project).where('projects.user_id = ? and projects.done = ? and tasks.done = ? and tasks.actual = ? and tasks.calendarity = ? and ' + date_str2, current_user.id, false, false, true, true).order('tasks.dt, tasks.tasktip_id desc')
    @tasks = Task.joins(:project).where('projects.user_id = ? and projects.done = ? and tasks.done = ? and tasks.actual = ? and tasks.calendarity = ?', current_user.id, false, false, true, false).order('tasks.tasktip_id desc')
    @projects = current_user.projects.all
    @task = Task.new
 else 
  redirect_to '/log_in'
 end
end

def inbox
   @tasks = Task.joins(:project).where('projects.user_id = ? and tasks.done = ? and projects.name = ?', current_user.id, false, "Inbox").order('tasks.tasktip_id desc')
end

def calendar
  @tasks = Task.joins(:project).where('projects.user_id = ? and projects.done = ? and tasks.done = ? and tasks.actual = ? and tasks.calendarity = ?', current_user.id, false, false, true, true).order('tasks.dt, tasks.tasktip_id desc')
end

def delayed
  @tasks = Task.joins(:project).where('projects.user_id = ? and projects.done = ? and tasks.done = ? and tasks.actual = ?', current_user.id, false, false, false).order('tasks.tasktip_id desc')
end

def links
  @tasks = Task.joins(:project).where('projects.user_id = ? and tasks.done = ? and projects.name = ?', current_user.id, false, "Links").order('tasks.tasktip_id desc')
end

def delegated
  @tasks = Task.joins(:project).where('projects.user_id = ? and tasks.done = ? and projects.name = ?', current_user.id, false, "Delegated").order('tasks.tasktip_id desc')
end

def someday
  @tasks = Task.joins(:project).where('projects.user_id = ? and tasks.done = ? and projects.name = ?', current_user.id, false, "Someday").order('tasks.tasktip_id desc')
end

def donelist
  @tasks = Task.joins(:project).where('projects.user_id = ? and tasks.done = ?', current_user.id, true).order('tasks.donedt DESC').limit(20)
end


def tagsearch
  if current_user
    if params[:search]
      @tasks = Task.select('tasks.*').joins(:tasks_tags).joins(:tags).joins(:project).where('tags.name = ? and projects.user_id = ? and tasks.done = ?', params[:search], current_user.id, false).uniq
    else
      @tasks = Task.limit(30).order("RANDOM()")
    end
 else 
  redirect_to '/log_in'
 end
end


def index
 if current_user
   #@tasks = current_user.tasks.where(done: false).order('actual desc, title, grade')
 else
   redirect_to log_in_path
 end
end


def create
  if current_user
    proj = Project.find(task_params[:project_id])
    task = proj.tasks.create(task_params)
    if (task.calendarity && current_user.schedules)
      #Delayed::Job.enqueue TelegramJob.new(task.object + " " + task.action)
      #Delayed::Job.enqueue(TelegramJob.new(task.object + " " + task.action), 0, task.dt.getutc)
      #task.schedulerid = sch_id
    end
    task.save
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Задача добавлена!' }
      format.js { render partial: 'listrefresh'  }
    end
  end
end



def itsdone
  @task.done = true
  @task.donedt = DateTime.now
  @task.save
  respond_to do |format|
    format.html { redirect_to :back, notice: 'Задача побеждена!' }
    format.js { render partial: 'listrefresh'  }
  end
end

def undone
  @task.done = false
  @task.save
  respond_to do |format|
    format.html { redirect_to :back, notice: 'Задача вернулась!' }
    format.js { render partial: 'listrefresh'  }
  end
end


def delay
  @task.actual = false
  @task.save
  respond_to do |format|
    format.js { render partial: 'listrefresh'  }
    format.html { redirect_to :back, notice: 'Задача отложена.' }
  end
end

def undelay
  @task.actual = true
  @task.save
  respond_to do |format|
    format.js { render partial: 'listrefresh'  }
    format.html { redirect_to :back, notice: 'Задача актуализирована.' }
  end
end


def edit
  #@task = Task.find(params[:id])
  @projects = current_user.projects.all
  @tags = @task.tags
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

private
def set_product
  @task = Task.find(params[:id])
end


def task_params
    params.require(:task).permit(:object, :action, :done, :actual, :calendarity, :project_id, :dt, :description, :tasktip_id)
end


end
