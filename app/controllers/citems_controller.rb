class CitemsController < ApplicationController
  def add
    @cartitem = Citem.new(:menu_id => params[:menu], :cart_id => current_cart.id)
    if @cartitem.save()
      redirect_to :back
    end
  end
end