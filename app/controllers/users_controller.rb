class UsersController < ApplicationController

	def index
		@users = User.all
		@ribbit = Ribbit.new
	end

	def new
		if current_user
			redirect_to buddies_path
		else
			@user = User.new
		end
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
		@ribbit = Ribbit.new
		@relationship = Relationship.where(follower_id: current_user.id, followed_id: @user.id).first_or_initialize if current_user
	end

	def buddies
		if current_user
			# buddies_ids = current_user.followeds.map{|user| user.id}.push(current_user.id)
			# buddies_ids = current_user.followeds.map(&:id).push(current_user.id)
			buddies_ids = current_user.followeds.ids.push(current_user.id)
			@ribbit = Ribbit.new
			@ribbits = Ribbit.where(user_id: buddies_ids)
		else
			redirect_to root_path
		end
	end

	def user_params
		params.require(:user).permit(:avatar_url, :bio, :email, :name, :password, :password_confirmation, :username)
	end
end
