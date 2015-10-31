class SessionUsersController < ApplicationController
	before_filter :authenticate_user, :only => [:home, :profile, :setting]
	before_filter :save_login_state, :only => [:login, :login_attempt]
	
	def home
			
	end
	
	def login
		redirect_to(:controller=>"users",:action=>"index")
	end
	
	def login_attempt
		auth_user= User.authenticate(params[:username_or_email],params[:login_password])
		
		if auth_user
			flash[:note]="Welcome"
			session[:user_id] = auth_user.id
			redirect_to(:controller=>"session_users",:action=>"home")
		
		else
			flash[:note]="Are u kidding"
			redirect_to(:controller=>"users",:action=>"index")
		end 
	end
	
	def logout
			session[:user_id]=nil
			redirect_to(:controller=>"users",:action=>"index")
	end
end
