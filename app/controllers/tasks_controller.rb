class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_task, only: [:edit]
  def new
  	@task = Task.new
  end

  def create
  	@task = Task.new(task_params)
  	@task.user_id = current_user.id
  	if @task.save
  	  redirect_to tasks_path, notice: "success to #{@task.name}"
  	else
  	  render :new
  	end
  end

  def index
  	@tasks = current_user.tasks
  end

  def show
  	@task = Task.find(params[:id])
  end

  def edit
  	@task = Task.find(params[:id])
  	if current_user != @task.user_id
  	  redirect_to tasks_path
  	end
  end

  private

  def task_params
  	params.require(:task).permit(:name, :description)
  end

  def ensure_correct_task
  	@task = Task.find(params[:id])
  	unless @task.user == current_user
  	  redirect_to tasks_path
  	end
  end
end
