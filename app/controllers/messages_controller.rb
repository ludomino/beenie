class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @category = Category.find(params[:category_id])
    @message.user = current_user
    @message.category = @category
    if @message.save
      CategoryChannel.broadcast_to(
        @category,
        {
          html: render_to_string(partial: "message", locals: { message: @message }), # broadcast the current_user's id so it is possible to verify in the
          # stimulus controller if it corresponds or not with
          # the client's current_user
          user_id: @message.user.id,
          username: @message.user.nickname,
          userimg: @message.user.photo.key
        }
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
