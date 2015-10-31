class ArticlesController < ApplicationController
  def new
  	@article = Article.new
  end

  def edit
  end
  
  def create
  	@user = User.find(session[:user_id])
    @article = @user.article.create(article_params)
    if @article.save
    	flash[:note]="Artilce Created"
    	redirect_to(:controller=>'session_users',:action=>'home')
    else
    	redirect_to 'new'
    end
  end
  
  private
  	def article_params
  		params.permit(:title,:body)
  	end
end
