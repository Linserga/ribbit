class SessionsController < ApplicationController
  
  def create
  	user = User.find_by username: params[:username]
  	if user and user.authenticate(params[:password])
  		flash[:success] = 'You are logged in'
  		session[:user_id] = user.id
  		redirect_to root_path
  	else
  		flash[:error] = 'Wrong credentials'
  		redirect_to root_path
  	end
  end

  def destroy
  	flash[:success] = 'Logged out'
  	session[:user_id] = nil
  	redirect_to root_path
  end
end
