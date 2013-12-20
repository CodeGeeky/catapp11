class MenusController < ApplicationController
<<<<<<< HEAD
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
=======
	def show
	end

>>>>>>> ad034b7d6e70df18b7087e426ad6fe1266b3d838
end
