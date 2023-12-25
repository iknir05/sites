class SessionsController < ApplicationController
	def new
		if Current.user
			flash[:notice] = "User is already logged in!"
		  	redirect_to home_path
		else
			@user = User.new	
		end
	end
	
	def create
		@user = User.new(user_params)
	
		if @user.password == @user.confirm_password && @user.save 
	        flash[:notice] = "User successfully created"
	        # session[:user_id] = @user.id
	        redirect_to '/sign_in'
     	else
     		if @user.password != @user.confirm_password
     			flash[:notice] = "Entered password does not match"
     		else
     			flash[:notice] = "Details are not correctly filled"
     		end
        	render 'new'
     	end
	end

	private
	  def user_params()
	    params.require(:user).permit(:first_name,:last_name,:email,:phone_number,:gender,:password,:confirm_password)
	  end
end
