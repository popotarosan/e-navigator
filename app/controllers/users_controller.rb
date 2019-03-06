class UsersController < ApplicationController
 
 
  #プロフィールの各機能を編集しDBに書き込む
  def update
    set_user
    if @user.update_attributes(user_params)
      flash[:success] = "保存に成功しました"
      render 'edit'
    else
      flash[:failure] = "保存に失敗しました"
      render 'edit'
    end
  end
  def edit
    set_user 
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :birthday, :gender,
                                 :school_name)
  end
end
