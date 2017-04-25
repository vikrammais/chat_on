class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def user_is_logged_in
	    if session[:user_id].blank?
	        redirect_to "/"
	    end
	end

end
