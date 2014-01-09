class UsersController < ApplicationController
  
  before_action :log_in_required, only: [:show, :edit, :update, :destroy]
  after_filter "save_my_previous_url", only: [:new]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if simple_captcha_valid?
      if @user.save
        flash[:sign_up] = true
        redirect_to session[:my_previous_url] #, :notice => "Signed up!"
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
  
  def show
    @user = User.find(:all)    
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      flash[:error_user_update] = true
      render "edit"
    end
  end
  
  def destroy
   User.find(params[:id]).destroy
   redirect_to root_url     
  end
  
  private
  def user_params
    params.require(:user).permit(:id, :name, :password, :password_confirmation, :email, :password_salt, :password_hash, :phone, :role, :photo)
  end 
  
  def log_in_required
    if current_user
      if current_user.phone != '9800000000'
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end
  def save_my_previous_url
    session[:my_previous_url] = URI(request.referer).path
  end
end
