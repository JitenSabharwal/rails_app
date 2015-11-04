class TestsController < ApplicationController
  def new
  	@test = Test.new
  end
  def index
  	@tests = Test.All	
  end
  def show
      @result=Result.find(params[:id])
  end
  def create
  	@test=Test.new(test_param)
  		if @test.save
  			redirect_to @test
  		else
  			flash[:note]="Error Occured"
  			render 'new'
      end	
  end
  def take_test
    @tests = Test.all
    
    @user = User.find(session[:user_id])
        
    if params[:id] 
      @test=Test.find(params[:id])
    else
      @test=Test.find(1)  
    end
    #if Result.find_by(user_id:@user.id,test_id:@test.id)
     if   @result=Result.find_by(user_id:@user.id,test_id:@test.id)    
    else
        @result=Result.new
      end
    #-----------------------------
    #respond_to do |format|
     # format.html 
      #format.js {redirect_to()}  
    #end   
  #----------------------------------
  end
  def enter

        @user = User.find(session[:user_id])
        @test =Test.find(params[:test_id])       
        @result=@user.result.create(result_param)  
        @result.save 
        #
            if @test.id >= Test.count
              redirect_to(:controller=>"tests",:action=>"take_test",:id=>1)       
            else
              redirect_to(:controller=>"tests",:action=>"take_test",:id=>@test.id+1)
            end    
  end
  def end_test
        @user = User.find(session[:user_id])
        @count=Result.joins(:test).where("results.selected = tests.correct",:user_id => @user.id).count 
  end
  private 
  	def test_param
  		params.require(:test).permit(:question,:option1,:option2,:option3,:option4,:correct)
  	end
    def result_param
      params.require(:result).permit(:selected,:test_id)
    end
end
