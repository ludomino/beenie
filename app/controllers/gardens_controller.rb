class GardensController < ApplicationController
  # def index
  #   @user_plants = current_user.user_plants
  # end

  def show
    @plants = current_user.user_plants
    # @user_plant = UserPlant.find(params[:id])
  end

end
