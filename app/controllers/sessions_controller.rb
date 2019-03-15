class SessionsController < ApplicationController
  before_action :set_format

  def set_format
    request.format = :json
  end

  def new
  end

  def create

    if session_params[:id]
      @user = User.find_by_auth_token(session_params[:id])
      if @user
        session[@user.auth_token] = @user.id
      end
    elsif user_params[:email]
      @user = User.find_by_email(user_params[:email])
      if @user && @user.authenticate(user_params[:password])
        session[@user.auth_token] = @user.id
      else
        @user = nil
      end
    end

    @session = @user
    if @session
      respond_to do |format|
        format.json {render :show, status: :created}
      end
    end
  end


  # def destroy
  #   session[:user_id] = nil
  #   redirect_to root_url, notice: "Logged out!"
  # end


  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:session).permit(:email, :password)
  end

  def session_params
    params.require(:session).permit(:id)
  end
end
