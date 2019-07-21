class TasksController < ApplicationController

  def index
    @tasks = Task.all.order(:id)
  end

  def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        redirect_to root_path
      else
        render :edit
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

  if @task.save
    redirect_to root_path
  else
    render :new
  end
end

  def task_params
    params.require(:task).permit(:name,:content)
  end
end
