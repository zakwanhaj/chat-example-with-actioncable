class SessionsController < ApplicationController
  skip_before_action :authenticated?, except: :destroy

  def show
    redirect_to root_path
  end

  # POST /session
  def create
    @session = Session.new(session_params)

    respond_to do |format|
      if @session.valid?
        cookies.signed[:uuid] = @session.uuid
        format.html { redirect_to channels_url, notice: 'Session was successfully created.' }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session
  def destroy
    cookies.signed[:uuid] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
