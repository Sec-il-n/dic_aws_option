class UsersController < ApplicationController
  skip_before_action :authenticate_user
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save

      redirect_to new_session_path, notice: 'ユーザー登録が完了しました。'
    else
      render :new
    end
  end
  def show

  end
  #loginしてから出ないと使用できなくする
  def edit

  end
  def update
    if current_user.id != @user.id
        redirect_to feeds_path, notice: '非登録ユーザー以外の編集はできません。'
    end
    if logged_in? && current_user.id == @user.id
      if @user.update(user_params)
        redirect_to feeds_path, notice: 'ユーザー登録を編集しました。'
      else
        flash.now[:danger] = 'ユーザー登録の編集に失敗しました。'
        render :edit
      end
    end
  end
  def destroy
    # 画面遷移しないので(パスも/feeds/:idのみ)不要？
    # if current_user.id != @user.id
    #     redirect_to feeds_path, notice: '非登録ユーザー以外の操作はできません。'
    # end
    # if logged_in? && current_user.id == @user.id
      @user.destroy
      redirect_to feeds_path, notice: 'ユーザー登録を削除しました。'
    # end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end
end
