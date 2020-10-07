class UsersController < ApplicationController
  # ログイン中の現在のユーザーの情報のみ編集できる
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @user = current_user
    @users = User.all.page(params[:page]).per(6)
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.page(params[:page]).per(6)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: "プロフィールを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path, notice: "アカウントを削除しました。"
  end

  private

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :first_kana, :last_name, :last_kana, :user_name, :post_number, :address, :email, :self_image, :introduction)
  end
end
