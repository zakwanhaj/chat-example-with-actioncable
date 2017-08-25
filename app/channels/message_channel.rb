class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "#{params[:channel_id]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def join_channel(data)
    stream_from "#{data['channel_id']}_channel"
  end

  def leave
    stop_all_streams
  end
end
