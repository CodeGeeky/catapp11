class MenusController < ApplicationController
  before_action :log_in_required
  
  def new
    @menu = Menu.new
  end
  def create 
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to :back
    else
      redirect_to root_url
    end
  end
  
  private
  def menu_params
    params.require(:menu).permit(:id, :item_name)
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
end
