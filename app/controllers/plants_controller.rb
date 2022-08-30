class PlantsController < ApplicationController
  def index
    if params[:query].present?
      @plants = Plant.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @plants = Plant.all
    end
  end

  def show
    @plant = Plant.find(params[:id])
    @user_plant = UserPlant.new
  end
end
