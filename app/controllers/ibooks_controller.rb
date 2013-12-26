class IbooksController < ApplicationController
  before_action :admin_required, only: [:show]
  before_action :log_in_required
  def confirm
    @ibook = Ibook.new(:user_id => current_user.id, :cart_id => current_cart.id)
    if @ibook.save()
      flash[:notice_book] = true
      redirect_to root_url
    end
  end
  
  def show
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
