class TasksController < ApplicationController
    before_action :set_task, only: %i[ show edit update destroy toggle_status]


    def index
      authorize Task    
      @tasks=Task.all
      
    end

    def new
      authorize Task
      @task = Task.new
      
    end

    def show
        authorize Task
    end

    def create
      @task = Task.new(task_params)
      respond_to do |format|
        if @task.save
          format.html { redirect_to @task, notice: "Task was successfully created." }
        else
          format.html { redirect_to @task, notice: "Validation Error" }
        end
      end
    end

    def destroy
      authorize Task
        @task.destroy
        respond_to do |format|
          format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
        end
    end

    def edit
      authorize Task
    end

    def update
        respond_to do |format|
            if @task.update(task_params)
              format.html { redirect_to @task, notice: "Task was successfully updated." }
            else
              format.html { render :edit, status: :unprocessable_entity }
            end
          end
    end






  private
    def set_task
        @task = Task.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :due_date, :task_type, :image, :business_id)
    end


end
