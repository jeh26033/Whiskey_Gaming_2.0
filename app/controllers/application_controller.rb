class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  private

	def require_signin!
	 if current_user.nil?
	  flash[:error] = "Please sign in..."
	  redirect_to root_path
	 end
	end



	def current_user
	  return nil unless session[:user_id]
	  @current_user ||= User.find_by(id: session[:user_id])
	end
helper_method :current_user
end
