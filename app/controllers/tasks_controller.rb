class TasksController < ApplicationController

  before_action :authenticate_user!

  def index

    @tasks = Task.where(completed: false).order('priority DESC')
    @completed_tasks = Task.where(completed: true).order('updated_at')
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new task_params

    @task.save
    if @task.valid?
      redirect_to tasks_path
    else
      render "new"
    end
  end

  def edit
    @task = Task.find params[:id]

  end

  def update
    @task = Task.find params[:id]

    @task.update_attributes task_params

    redirect_to tasks_path
  end

  def complete
    @task = Task.find params[:id]
    @task.complete!
    redirect_to tasks_path
  end

  def destroy
    @tasks = Task.find params[:id]
    @tasks.destroy
    redirect_to tasks_path
  end

  def destroy_multiple
    Task.where(id: params[:tasks]).destroy_all
    redirect_to tasks_path
  end


  private

  def task_params
    params.require(:task).permit([
                                     :title, :priority, :completed, :date, :description
                                 ])
  end

end

