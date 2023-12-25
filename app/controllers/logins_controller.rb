class LoginsController < ApplicationController
	def new
		if Current.user
			flash[:notice] = "User is already logged in!"
		  	redirect_to home_path
		else
			@user = User.new	
		end

	end

	def create
		 @user = User.find_by(email: params[:user][:email])
		 # byebug

	    if @user.present? && @user.password == params[:user][:password]
	      flash[:notice] = "User has successfully logged in"
	      session[:user_id] = @user.id
	      redirect_to '/home'
	    else
	       @user = User.new		
	      flash[:notice] = "Invalid credentials entered"
	      render 'new'
	    end  
	end
	def destroy
		session[:user_id] = nil 
		flash[:notice] ="User is logged out"
		redirect_to root_path

	end
end
	