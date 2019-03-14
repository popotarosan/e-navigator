class InterviewsController < ApplicationController
  before_action :set_user, only: [:index]
  
  def index
    @interviews =  Interview.find_by(user_id:@user.id)
    
  end
  
  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
