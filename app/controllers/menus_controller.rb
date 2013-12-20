class MenusController < ApplicationController
  before_action :log_in_required
  
  def new
  
  def log_in_required
    if current_user
      if current_user.phone != '9800000000'
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end

	def show
	end


end
