class MainController < ApplicationController
  skip_before_action :authenticated?

  def index
    redirect_to messages_path if Session.find(cookies.signed[:uuid])

    @session = Session.new
  end
end
