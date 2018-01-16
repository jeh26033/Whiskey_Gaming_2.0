module SessionsHelper
	def current_user
	    if cookies[:remember_token].present?
	    	@current_user ||= User.find_by_remember_token(cookies[:remember_token])
		end
	end

  def log_out
    session.delete(:uid)
    @current_user = nil
  end

end
