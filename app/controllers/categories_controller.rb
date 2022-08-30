class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @messages = @category.messages.order(created_at: :DESC)
  end
end
