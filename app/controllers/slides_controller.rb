class SlidesController < ApplicationController
  def new
    @slide = Slide.new
  end
  def create
    @slide = Slide.new(slide_params)
      if @slide.save
        redirect_to :back
      else
        flash[:error_slide] = true
        flash[:notice_slide] = @slide.errors.full_messages
        redirect_to root_url
      end
  end
  def edit
    @slide = Slide.find(params[:id])
  end
  
  def update
    @slide = Slide.find(params[:id])
    if @slide.update_attributes(slide_params)
      redirect_to root_url
    else
      flash[:error_slide_update] = true
      render "edit"
    end
  end
  
  def destroy
   Slide.find(params[:id]).destroy
   redirect_to root_url     
  end
  private
  def slide_params
    params.require(:slide).permit(:id, :title, :description, :photo)
  end 
end
