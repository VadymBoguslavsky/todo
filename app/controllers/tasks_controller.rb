class TasksController < ApplicationController

  before_action :authenticate_user!

  def index
    @tasks = Task.where(completed: false).order('priority DESC')
  end

  def completed_tasks
    @completed_tasks = Task.where(completed: true).order('updated_at')
  end


  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.save
    if @task.valid?
      flash[:notice] = "Task successfully created"
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
    @task = Task.find params[:id]
    # binding.pry
    if current_user.id == @task.user_id
      @task.destroy
      flash[:notice] = "You succesfully deleted task"
      redirect_to tasks_path
    else
      flash[:notice] = "You do not have the permittions to delete this task"
      redirect_to tasks_path
    end
  end

  def destroy_multiple
    Task.where(id: params[:tasks]).destroy_all
    redirect_to tasks_path
  end


  private

  def task_params
    params.require(:task).permit([
                                     :title, :priority, :completed, :date, :description, :user_id
                                 ])
  end

end

