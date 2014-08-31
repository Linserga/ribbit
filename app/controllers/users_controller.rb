class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:success] = 'Account was successfully created'
			redirect_to @user
		else
			flash.now[:error] = 'Error occured'
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:avatar_url, :bio, :email, :name, :password, :password_confirmation, :username)
	end
end
