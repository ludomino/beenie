class GardensController < ApplicationController
  # def index
  #   @user_plants = current_user.user_plants
  # end

  def show
    @user_plants = current_user.user_plants
    # @user_plant = UserPlant.find(params[:id])
    @coucou = FetchWeather.new(current_user).call
  end

end
