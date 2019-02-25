class UsersController < ApplicationController
 
 
  #プロフィールの各機能を編集しDBに書き込む
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "保存に成功しました"
      render 'edit'
    else
      render 'edit'
    end
  end
  #画面表示のみなので実装しない
  def edit
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :birthday, :gender,
                                   :school_name)
  end
end
