class UsersController < ApplicationController
  def show
    @user = current_user
    # @plant = user_plants
  end
end
