class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.save

    render js: "$('#message_body').val('')"
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:channel_id, :body)
  end
end
