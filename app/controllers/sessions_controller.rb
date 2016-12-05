class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by_email(session_params[:email])
		if @user && @user.authenticate(session_params[:password])
			session[:user_id] = @user.id
			flash.notice = "Welcome, joshhhh@nextacademy.com!"
			redirect_to statuses_path
		else
			flash.alert = "Please log in again"
			render :new
		end
	end

	def destroy 
		session[:user_id] = nil
		redirect_to root_path
	end

	private 
	def session_params
		params.require(:session).permit(:email, :password, :password_confirmation)
	end
end
