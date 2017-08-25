class Channel
  include ActiveModel::Model

  CHANNEL_NAMES = %w(sales developers designers).freeze

  attr_accessor :id
  alias_attribute :name, :id

  def self.all
    CHANNEL_NAMES.map { |channel_name| new id: channel_name }
  end

  def to_param
    id
  end
end
