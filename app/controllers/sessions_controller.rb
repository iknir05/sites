class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
	        flash[:notice] = "User successfully created"
	        session[:user_id] = @user.id
	        redirect_to '/login'
     	else
        	render 'new'
     	end
	end

	private
	  def user_params()
	    params.require(:user).permit(:first_name,:last_name,:email,:phone_number,:gender,:password,:confirm_password)
	  end
end