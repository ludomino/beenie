class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @category = Category.find(params[:category_id])
    @message.user = current_user
    @message.category = @category
    if @message.save
      CategoryChannel.broadcast_to(
        @category,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    else
      render "categories/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :photo, :picture)
  end
end
