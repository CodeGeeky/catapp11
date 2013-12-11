class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if simple_captcha_valid?
      if @user.save
        redirect_to root_url #, :notice => "Signed up!"
      else
        flash[:error_signup] = true
        flash[:notice] = @user.errors.full_messages
        redirect_to root_url
      end
    else
      flash[:error_captcha] = true
      redirect_to root_url
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email, :password_salt, :password_hash, :phone)
  end 
end
