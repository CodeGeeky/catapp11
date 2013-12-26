class CitemsController < ApplicationController
  before_action :log_in_required
  def add
    @cartitem = Citem.new(:menu_id => params[:menu], :cart_id => current_cart.id)
    if @cartitem.save()
      redirect_to :back
    end
  end
  
  def show
    # join Citem and Menu table    
    @list = Citem.joins(:menu).where(cart_id: current_cart.id)
  end
  
  def list
    @list = Citem.where(cart_id: params[:ibook]).find(:all, :include => :menu)
  end
  
  def remove
    # remove item from cart.
    Citem.find(params[:list]).destroy
    redirect_to :back
  end
  
  def removeall
    # remove all items from cart.
    Citem.delete_all(cart_id: current_cart.id)
    redirect_to :controller => 'menus', :action => 'show'
  end
  
  def log_in_required
    if not current_user
      redirect_to root_url
    end
  end
end