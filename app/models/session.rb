class Session
  include ActiveModel::Model
  include ActiveModel::Validations

  USERNAMES = %w(zakwan).freeze

  attr_accessor :username, :password
  attr_reader :uuid

  validates_presence_of :username, :password

  validates_each :username, :password do |record, attr, value|
    next if record.errors.messages.key?(attr)
    record.errors.add attr, 'is incorrect' if USERNAMES.exclude? value
  end

  def initialize(attributes = {})
    super
    @uuid = Base64.urlsafe_encode64(username) if username
  end

  def self.find(uuid)
    return if uuid.blank?

    username = Base64.urlsafe_decode64(uuid)
    return if USERNAMES.exclude? username

    new username: username
  end
end
