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
		@user = User.find(params[:id])
	end

	def update
	    @user = User.find(params[:id])
	    if @user.update(user_params)
	      redirect_to user_path, notice: "You have updated user successfully."
	    else
	      render :edit
	    end
	    binding.pry
	end

	def destroy
	end

	private
	def correct_user
		user = User.find(params[:id])
		if current_user != user
			redirect_to user_path(current_user)
		end
	end

	def user_params
		params.require(:user).permit( :first_name, :first_kana, :last_name, :last_kana, :user_name, :post_number, :address, :email, :self_image, :introduction)
	end
end
