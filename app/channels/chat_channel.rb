class ChatChannel < ApplicationCable::Channel
  def subscribed
    return unless params[:subject_id]

    stream_from "chat_#{params[:subject_id]}"
  end
end
