class PersonalTasksController < ApplicationController
  def create
    @personal_task = PersonalTask.new(personal_task_params)
    @personal_task.user_plant = UserPlant.find(params[:user_plant_id])
    @personal_task.save!
    redirect_to user_plant_path(UserPlant.find(params[:user_plant_id]))
  end

  def edit
    @personal_task = PersonalTask.find(params[:id])
  end

  def update
    @personal_task = PersonalTask.find(params[:id])
    @personal_task.update(personal_tasks_params)
    redirect_to user_plant_path(UserPlant.find(params[:user_plant_id]))
  end

  def destroy
    @personal_task = PersonalTask.find(params[:id])
    @personal_task.destroy
    redirect_to user_plant_path(UserPlant.find(params[:user_plant_id])), status: :see_other
  end

  private

  def personal_task_params
    params.require(:personal_task).permit(:description)
  end
end
