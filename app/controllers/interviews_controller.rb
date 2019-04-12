class InterviewsController < ApplicationController
  before_action :set_user, only: [:index,:new,:create,:update,:destroy]
  before_action :set_interview, only: [:edit,:update,:destroy]
  def index
    @interviews =  @user.interviews
    @confirmed_interview = Interview.find_by("interviewer_id is not null and user_id = ?",@user.id)
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
  def show
    
  end
  
  #面接情報を更新する
  def update
    #自分の面接を更新する場合
    if current_user == @user
      if @interview.update_attributes(interview_params)
        flash[:success] = "保存に成功しました"
        redirect_to user_interviews_path(@user)
      else
        flash[:failure] = "保存に失敗しました"
        render 'edit'
      end
    #他の人の面接を更新する場合
    else
      @old_confirmed_interview = @user.interviews.find_by("interviewer_id is not null")
      Interview.transaction do
        if @interview == @old_confirmed_interview
          flash[:failure] = "選んだ面接はすでに承認されています"
          redirect_to user_interviews_path(@user)
        elsif @interview.scheduled_at < Time.now
          flash[:failure] = "その面接は現在時刻より前なので、設定できません"
          redirect_to user_interviews_path(@user)
        elsif @interview.update_attributes!(interviewer_id:current_user.id,status:"承認") and 
        @user.interviews.where("id != ?",@interview.id).update_all(interviewer_id:nil,status:"拒否")
          flash[:success] = "面接日程を承認しました"
          redirect_to user_interview_path(@user,@interview)
        else
          flash[:failure] = "面接日程の承認に失敗しました"
          redirect_to user_interviews_path(@user)
          raise ActiveRecord::Rollback
        end
      end
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
