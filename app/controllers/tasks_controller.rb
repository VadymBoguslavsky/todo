class TasksController < ApplicationController

  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.all
    if params[:search]
      @tasks = Task.search(params[:search]).order(sort_column + " " + sort_direction).where(completed: false).paginate(:per_page => 10, :page => params[:page])
      @completed_tasks = Task.search(params[:search]).order(sort_column + " " + sort_direction).where(completed: true).where(completed: true).paginate(:per_page => 10, :page => params[:page])
    else
      @tasks = Task.all.order("created_at DESC").order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
      @completed_tasks = Task.all.order("created_at DESC").order(sort_column + " " + sort_direction).where(completed: true).paginate(:per_page => 10, :page => params[:page])
    end
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
    Task.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  def task_params
    params.require(:task).permit([
                                     :title, :priority, :completed, :date, :description, :user_id
                                 ])
  end
end