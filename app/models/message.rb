class Message
  include ActiveModel::Model

  attr_accessor :channel_id, :body

  def save
    return if channel_id.blank? || body.blank?

    broadcast!
  end

  private

  def broadcast!
    ActionCable.server.broadcast "#{channel_id}_channel", message: "you type: #{body}"
  end
end
