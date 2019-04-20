class UsersController < ApplicationController
  before_action :set_user, only: [:edit,:update]
 
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "保存に成功しました"
      render 'edit'
    else
      flash[:failure] = "保存に失敗しました"
      render 'edit'
    end
  end
  def edit
  
  end
  def index
    @users = User.all
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :birthday, :gender, :school_name)
  end
end
