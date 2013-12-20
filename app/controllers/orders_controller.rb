class OrdersController < ApplicationController
  before_action :log_in_required
  
  def new
    @order = Order.new
  end
  def create
    @order = Order.new(params[:order])
    if @order.save
      redirect_to :back
    else
      redirect_to root_url
    end  
  end
  
  def log_in_required
    if not current_user
      redirect_to root_url
    end
  end
end
