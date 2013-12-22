class ApplicationController < ActionController::Base
  
  include SimpleCaptcha::ControllerHelpers
   # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :current_cart, :count
  private
  
  after_filter :add_flash_to_header

  def add_flash_to_header
    # only run this in case it's an Ajax request.
    return unless request.xhr?

    # add different flashes to header
    response.headers['X-Flash-Error'] = flash[:error] unless flash[:error].blank?
    response.headers['X-Flash-Warning'] = flash[:warning] unless flash[:warning].blank?
    response.headers['X-Flash-Notice'] = flash[:notice] unless flash[:notice].blank?
    response.headers['X-Flash-Message'] = flash[:message] unless flash[:message].blank?

    # make sure flash does not appear on the next page
    flash.discard
  end
  def count
    @count ||= Citem.where(cart_id: session[:cart_id]).count
  end
    
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def current_cart
    @current_cart ||= Cart.find(session[:cart_id]) if session[:cart_id]
  end
  
end
