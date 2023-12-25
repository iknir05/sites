class PasswordsController < ApplicationController
  before_action :require_user_logged_in!

  def edit
  end

  def update

    if Current.user.update(password_params)      
      redirect_to log_in_path
      flash[:notice] ="User password successfully updated"
    else
      flash[:notice] ="Password entered is not updated"
      render 'edit'
    end
  end

  private
  def password_params
    params.require(:user).permit(:password,:confirm_password)
  end
end
