class WelcomeController < ApplicationController
  before_action :log_in_required, only: [:edit, :update]
  def index 
  end
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
  def log_in_required
      redirect_to root_url unless current_user
  end
end
