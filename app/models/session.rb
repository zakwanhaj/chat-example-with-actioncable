class Session
  include ActiveModel::Model
  include ActiveModel::Validations

  USERNAMES_PASSWORDS = {
    'emran' => 'emran',
    'zakwan' => 'zakwan'
  }.freeze

  attr_accessor :username, :password
  attr_reader :uuid

  validates_presence_of :username, :password

  validates_each :username, :password do |record, attr, value|
    next if record.errors.messages.key?(attr)
    collection = USERNAMES_PASSWORDS.send(attr == :password ? :values : :keys)
    record.errors.add attr, 'is incorrect' if collection.exclude? value
  end

  def initialize(attributes = {})
    super
    @uuid = Base64.urlsafe_encode64(username) if username
  end

  def self.find(uuid)
    return if uuid.blank?

    username = Base64.urlsafe_decode64(uuid)
    return if USERNAMES_PASSWORDS.keys.exclude? username

    new username: username
  end
end
