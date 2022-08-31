class CategoryChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    category = Category.find(params[:id])
    stream_for category
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
