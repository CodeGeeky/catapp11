class CitemsController < ApplicationController
  def add
    @cartitem = Citem.new(:menu_id => params[:menu], :cart_id => current_cart.id)
    if @cartitem.save()
      redirect_to :back
    end
  end
  
  def show
    @list = Citem.where(cart_id: current_cart.id).to_a  
  end
end