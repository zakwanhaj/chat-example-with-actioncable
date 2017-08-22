class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticated?

  def authenticated?
    @current_user = Session.find(cookies.signed[:uuid])
    return true if @current_user

    redirect_to root_url
  end
end
