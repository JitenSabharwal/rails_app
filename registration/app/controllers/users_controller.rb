class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]
  def new
  	@user= User.new
  end

  def index
  	#login
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:note]="Registered Successfully"
  		redirect_to @user
  	else
  		flash[:note]="Error Occured"
  		render 'new'		
  	end	 
  end
  def edit
  	@user = User.find(params[:id])
  end
  def show
  	@user = User.find(params[:id]) 
  end

  private
  	def user_params
  		params.permit(:username , :password , :email)
  	end
end
