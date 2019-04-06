class InterviewsController < ApplicationController
  before_action :set_user, only: [:index,:new,:create,:update,:destroy]
  before_action :set_interview, only: [:edit,:update,:destroy]
  def index
    @interviews =  @user.interviews
    
  end
  
  def new
    @interview = Interview.new
  end
  
  def create
    @interview = current_user.interviews.new(interview_params)
    if @interview.save
      flash[:success] = "保存に成功しました"
      redirect_to user_interviews_path(@user)
    else
      flash[:failure] = "保存に失敗しました"
      render 'new'
    end
      
  end
  
  def edit
        
  end
  
  #面接情報を更新する
  def update
    if @interview.update_attributes(interview_params)
      flash[:success] = "保存に成功しました"
      redirect_to user_interviews_path(@user)
    else
      flash[:failure] = "保存に失敗しました"
      render 'edit'
    end
  end
  #面接情報を削除する
  def destroy
    if @interview.destroy
       flash[:success] = "削除に成功しました"
    else
       flash[:failure] = "削除に失敗しました"
    end
    redirect_to user_interviews_path(@user)
  end
  
  private
  
  def interview_params
    params.require(:interview).permit(:scheduled_at)
  end
  def set_user
    @user = User.find(params[:user_id])
  end
  def set_interview
    @interview = Interview.find(params[:id])    
  end
    
end
