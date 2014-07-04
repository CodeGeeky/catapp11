class IbooksController < ApplicationController
  before_action :admin_required, only: [:show]
  before_action :log_in_required
  def confirm
    if params[:for_when]
      @ibook = Ibook.new(:user_id => current_user.id, :cart_id => current_cart.id, :for_when => params[:for_when])
      if @ibook.save()
        flash[:notice_book] = true
        redirect_to root_url
      end
    else
      redirect_to '/calender/calender'
    end
  end
  
  def show
    Ibook.where('for_when < ?', Date.today).destroy_all
    @ibook = Ibook.find(:all, :include=>:user)
    
  end
  
  def log_in_required
    if not current_user
      redirect_to root_url
    end
  end
  
  def admin_required
    if not current_user
      redirect_to root_url
    else
      redirect_to root_url unless current_user.phone == '9800000000' or current_user.role == 'admin'
    end
  end
end
