class InterviewsController < ApplicationController
  before_action :set_user, only: [:index,:new,:create]
  
  def index
    @interviews =  @user.interviews
    
  end
  
  def new
    @interview = Interview.new
  end
  
  def create
    @interview = Interview.new(interview_params)
    @interview.user_id = current_user.id
    if @interview.save
      flash[:success] = "保存に成功しました"
      redirect_to user_interviews_path(@user)
    else
      flash[:failure] = "保存に失敗しました"
      render 'new'
    end
      
  end
  private
  
  def interview_params
    params.require(:interview).permit(:scheduled_at)
  end
  def set_user
    @user = User.find(params[:user_id])
  end
end
