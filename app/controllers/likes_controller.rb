class LikesController < ApplicationController

	def create 
		@status = Status.find(likes_params[:status])
		@user = User.find(likes_params[:user])

		@like = Like.new(:status => @status, :user => @user)
		if @like.save
			flash.notice = "You liked #{@status.title}!"
			redirect_to root_path
		else
			flash.alert = "You liked before!"
			redirect_to root_path
		end
	end

	def destroy 
		@like = Like.find(params[:id])
		@like.destroy
		flash.notice = "You unlike."
		redirect_to status_path @like.status
	end


	def likes_params
		params.require(:like).permit(:status, :user)
	end
end
