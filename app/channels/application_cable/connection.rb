module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = verified_current_user
      logger.add_tags 'ActionCable', current_user.username
    end

    protected

    def verified_current_user
      if (verified_user = Session.find cookies.signed[:uuid])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
