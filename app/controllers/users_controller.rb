class UsersController < ApplicationController
	# ログイン中の現在のユーザーの情報のみ編集できる
	before_action :correct_user, only: [:edit, :update]

	def index
		@user = current_user
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@articles = @user.articles
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def corrent_user
		user = User.find(params[:id])
		if corrent_user != user
			redirect_to user_path(current_user)
		end
	end

	def user_params
		params.require(:user).permit( :first_name, :first_kana, :last_name, :last_kana, :user_name, :post_number, :address, :email)
	end
end
