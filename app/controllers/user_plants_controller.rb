class UserPlantsController < ApplicationController
<<<<<<< HEAD
=======

>>>>>>> 58e0a885b9a920df7c44ba02c7ec141702d48671
  def show
    @user_plant = UserPlant.find(params[:id])
    @personal_task = PersonalTask.new
  end

  def create
    @user_plant = UserPlant.new(user_plant_params)
    @user_plant.save
    redirect_to my_garden_path(@user_plant)
  end

  def edit
    @user_plant = UserPlant.find(params[:id])
  end

  def update
    @user_plant = UserPlant.find(params[:id])
    @user_plant.update(user_plant_params)
    redirect_to user_plant_path(@user_plant)
  end

  def destroy
    @user_plant = UserPlant.find(params[:id])
    @user_plant.destroy
    redirect_to my_garden_path, status: :see_other
  end

  private

  def user_plant_params
    params.require(:user_plant).permit(:planted_day)
  end
end
