class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @messages = @category.messages.order(created_at: :DESC)
    # englobe message.new dans un if :
    # verifier si category_id est inclus dans une des plantes du user ( method .pluck(:nom_de_la_table_voulue) w )
    @message = Message.new
  end
end
