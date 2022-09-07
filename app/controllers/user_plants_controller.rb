class UserPlantsController < ApplicationController
  def show
    @user_plant = UserPlant.find(params[:id])
    @plant = @user_plant.plant
    @personal_task = PersonalTask.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @user_plant = UserPlant.new(user_plant_params)
    @user_plant.plant = @plant
    @user_plant.user = current_user
    if @user_plant.save
      redirect_to garden_path(current_user)
      flash.notice = "This plant was just added to your wishlist !"
    else
      render "plants/show", status: :unprocessable_entity
    end
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

  def buy_plant
    @user_plant = UserPlant.find(params[:id])
    @user_plant.planted_day = Date.today
    @user_plant.save
    redirect_to garden_path(@user_plant.user)
  end

  private

  def user_plant_params
    params.require(:user_plant).permit(:planted_day)
  end
end
