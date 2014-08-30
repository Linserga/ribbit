class UsersController < ApplicationController

	def user_params
		params.require(:user).permit(:avatar_url, :bio, :email, :name, :password, :password_confirmation, :username)
	end
end
