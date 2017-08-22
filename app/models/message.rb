class Message
  include ActiveModel::Model

  attr_accessor :body

  def self.all
    []
  end

  def save
    return if body.blank?

    broadcast!
  end

  private

  def broadcast!
    ActionCable.server.broadcast 'sales_channel', message: "you type: #{body}"
  end
end
