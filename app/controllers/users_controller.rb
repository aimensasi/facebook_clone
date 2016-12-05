class UsersController < ApplicationController


	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash.notice = "Account created. Please log in now."
			redirect_to user_path @user
		else
			flash.alert = "Error creating account: "
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update 
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash.notice = "Account is updated successfully."
			redirect_to user_path @user
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash.notice = "Account is deleted"
		redirect_to statuses_path
	end


	private 
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end

