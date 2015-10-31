class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	protected 
		def authenticate_user
			if session[:user_id]
				@current_user = User.find session[:user_id]
				return true
			else
				redirect_to(:controller=>"users",:action=>"index")
				return false
			end	
		end
		
		def save_login_state
			if session[:user_id]
				redirect_to(:controller=>"session_users",:action=>"home")
				return false
			else
				return true
			end
		end  	
		
  
end
