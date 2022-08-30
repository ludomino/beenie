class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    redirect_to category_path(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
