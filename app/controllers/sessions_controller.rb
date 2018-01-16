class SessionsController < ApplicationController
skip_before_action :verify_authenticity_token, only: :create

  def create
    begin
      @user = User.from_omniauth request.env['omniauth.auth']
    rescue
      flash[:error] = "Can't authorize you..."
    else
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.nickname}!"
    end
    redirect_to root_path
  end

  def destroy
	  if current_user
	    session.delete(:user_id)
	    flash[:success] = "Goodbye!"
	    redirect_to root_path
	  end
	end
end