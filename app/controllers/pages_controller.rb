class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
    @plants = Plant.all.sample(10)
  end

  def my_garden
    @plants = current_user.user_plants
    FetchWeather.new(current_user).call
  end
end
