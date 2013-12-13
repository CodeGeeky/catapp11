class WelcomeController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
     respond_to do |format|
      if @user.update(user_params)
       format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
      format.html { render action: "edit" }
     end
  end
 end

  private
  def set_user
      @user = current_user
  end
  def user_params
      params.require(:user).permit(:name, :phone, :email, :photo)
  end

end
