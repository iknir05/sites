class LoginsController < ApplicationController
	def new
		  @user = User.new	
	end

	def create
		 @user = User.find_by(email: params[:user][:email])
		 # byebug

	    if @user.present? && @user.password == params[:user][:password]
	      flash[:notice] = "Login allowed"
	      session[:user_id] = @user.id
	      redirect_to '/home'
	    else
	      flash[:notice] = "Invalid credentials"
	      render 'new'
	    end  
	end
	def destroy
		session[:user_id] = nil 
		redirect_to root_path, flash[:notice] ="Logged out"
	end
end
	