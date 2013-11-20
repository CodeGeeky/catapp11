class PagesController < ApplicationController
  def login
  	
  end
  def create
    user = User.authenticate(params[:phone], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in"
    else
      flash.now.alert = "Invalid phone or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged Out"
  end
  
end
