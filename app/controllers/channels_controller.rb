class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def show
    @channel = Channel.new id: params[:id]
    @message = Message.new channel_id: @channel.id
  end
end
