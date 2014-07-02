class MenusController < ApplicationController
  require 'date'

  before_action :log_in_required, only: [:new, :create, :edit, :update, :destroy]
  def new
    @menu = Menu.new
  end
  def create 
    #@menu = current_user.menus.build(menu_params)
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to :back
    else
      flash[:error_menu] = true
      flash[:notice_menu] = @menu.errors.full_messages
      redirect_to :back 
    end
  end
  def show
    # @ibook = Ibook.new(:for_when => params[:mdate])
    # @ibook.save
    print params[:category]
    if params[:category] and params[:category] != 'all'
      @menu = Menu.where('category = :category', {category: params[:category]})
    else
      @menu = Menu.find(:all)
    end
    @for_when = params[:mdate]
    if @for_when
      @dateT = Date.parse(@for_when)
    end
  end
  def edit
    @menu = Menu.find(params[:id])
  end
  
  def update
    @menu = Menu.find(params[:id])
    if @menu.update_attributes(menu_params)
      redirect_to @menu
    else
      flash[:error_menu_update] = true
      render "edit"
    end
  end
  def destroy
   Menu.find(params[:id]).destroy
   redirect_to :back  
  end
  
  private
  def menu_params
    params.require(:menu).permit(:id, :item_name, :category, :price, :description, :photo)
  end 
  
  def log_in_required
    if not current_user
      redirect_to root_url
    else
      redirect_to root_url unless current_user.phone == '9800000000' or current_user.role == 'admin'
    end
  end
end
