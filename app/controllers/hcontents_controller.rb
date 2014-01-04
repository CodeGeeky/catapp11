class HcontentsController < ApplicationController
  before_action :log_in_required, only: [:new, :edit, :update, :destroy]
  def new
    @hcon = Hcontent.new
  end
  def create
    @hcon = Hcontent.new(hcontent_params)
    if @hcon.save
      redirect_to :back
    else
      redirect_to root_url
    end
  end
  def edit
    @hcon = Hcontent.find(params[:id])
  end
  
  def update
    @hcon = Hcontent.find(params[:id])
    if @hcon.update_attributes(hcontent_params)
      redirect_to @hcon
    else
      render "edit"
    end
  end
  
  def destroy
   Hcontent.find(params[:id]).destroy
   redirect_to root_url     
  end
  private
  def hcontent_params
    params.require(:hcontent).permit(:title, :subtitle, :content)
  end 
  def log_in_required
    if not current_user
      redirect_to root_url
    else
      redirect_to root_url unless current_user.phone == '9800000000' or current_user.role == 'admin'
    end
  end
end
