class TasksController < ApplicationController
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
  end

  private

  def task_params
  	params.require(:task).permit(:name, :description)
  end
end
