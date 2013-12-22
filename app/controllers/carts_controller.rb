class CartsController < ApplicationController
  def new
    @cart = Cart.new
  end
  def add
    @citem = Citem.new(params[:menu_id])
  end
end
