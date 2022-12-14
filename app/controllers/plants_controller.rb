class PlantsController < ApplicationController
  def index
    if params[:query].present?
      @plants = Plant.global_search(params[:query])
    else
      @plants = Plant.all
    end
  end

  def show
    @plant = Plant.find(params[:id])
    @user_plant = UserPlant.new
  end

  def plant_params
    params.require(:plant).permit(:image, :name, :description)
  end
end
