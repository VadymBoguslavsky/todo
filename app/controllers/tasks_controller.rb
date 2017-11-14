class TasksController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.search_for(params[:search]).order(sort_column + " " + sort_direction).active.paginate(:per_page => 10, :page => params[:page])
    @completed_tasks = current_user.tasks.search_for(params[:search]).order(sort_column + " " + sort_direction).completed.paginate(:per_page => 10, :page => params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      HardWorker.perform_async("02-03-16", "03-03-16")
      flash[:notice] = "Task successfully created"
      redirect_to tasks_path
    else
      render "new"
    end
  end

  def show
    @task = current_user.tasks.find_by_id params[:id]
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
    @tasks = current_user.tasks
    @task = @tasks.find params[:id]
    @task.update_attribute(:completed, true)
    redirect_to tasks_path
  end

  def destroy
    @tasks = current_user.tasks
    @task = @tasks.find params[:id]
    @task.destroy
    flash[:notice] = "You succesfully deleted task"
    redirect_to tasks_path
  end

  def destroy_multiple
    Task.where(id: params[:tasks]).destroy_all
    redirect_to tasks_path
  end

  private
  def sort_column
    params[:sort] || "title"
  end

  def sort_direction
    params[:direction] || "asc"
  end

  def task_params
    params.require(:task).permit([
                                     :title, :priority, :completed, :date, :description, :user_id
                                 ])
  end
end