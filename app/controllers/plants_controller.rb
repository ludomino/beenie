class PlantsController < ApplicationController
  def index
    @plants = Plant.all
    # search params[:query]
  end

  def show
    @plant = Plant.find(params[:id])
  end
end
