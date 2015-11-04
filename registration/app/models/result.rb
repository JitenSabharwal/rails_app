class Result < ActiveRecord::Base
  belongs_to :user
  belongs_to :test
  validates :test_id ,:selected, presence:true
  before_save :check
  def check 
  		if selected.present?
  			if verify(user_id,test_id)
  				Result.where(:user_id=>user_id , :test_id=>test_id).limit(1).update_all(:selected=>selected)
  				return false
  			else
  				return true
  			end
  			else
          return false	
  		end
  end
  public
  def verify(user_id="",test_id="")
    if Result.find_by_user_id(user_id) && Result.find_by_test_id(test_id)
          return true
     else
          return false      
        
    end
  end 
end
