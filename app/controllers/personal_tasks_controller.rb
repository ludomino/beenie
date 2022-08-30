class PersonalTasksController < ApplicationController
  def new
    @personal_task = PersonalTask.new
  end

  def create
    @personal_task = PersonalTask.new(personal_task_params)
    @personal_task.save
    redirect_to my_garden_path(@personal_task)
  end

  private

  def personal_task_params
    params.require(:personal_task).permit(:description)
  end
end
