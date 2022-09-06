class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @messages = @category.messages.order(created_at: :DESC)
    @message = Message.new
  end

  def category_params
    params.require(:category).permit(:name, :picture)
  end
end
