class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(session_params[:username], session_params[:password])
    if user
      log_in_user(user)
      redirect_to user_url(user)
    else
      flash[:messages] = user.errors.full_messages
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end
end
