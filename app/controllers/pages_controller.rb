class PagesController < ApplicationController
  after_filter "save_my_previous_url", only: [:new]
  def login
  	
  end
  def new
    
  end
  def create
    user = User.authenticate(params[:phone], params[:password])
    if user
      session[:user_id] = user.id
      
      @cart = Cart.new(params[:id])
      @cart.user_id = current_user.id
      @cart.save
      redirect_to session[:my_previous_url] #, :notice => "Logged in"
    else
      
      #flash.now.alert = "Invalid phone or password"
      #render "login"
      flash[:error] = true
      redirect_to root_url
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url #, :notice => "Logged Out"
    #render 'welcome/index'
  end
  
  def save_my_previous_url
    session[:my_previous_url] = URI(request.referer).path
  end
  
end
