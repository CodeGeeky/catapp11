class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.deliver
      flash[:notice_feedback] = true
      redirect_to root_url
    else
      flash[:error_feedback] = true
      flash[:notice_feedback] = @inquiry.errors.full_messages
      redirect_to root_url
    end
  end
end