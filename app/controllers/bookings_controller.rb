class BookingsController < ApplicationController
	def new
		@booking = Booking.new
	end

	def create
		@booking = Booking.new(book_param)
		if @booking.save
			redirect_to root_url
		else
			flash[:notice_booking_failed] = true
			redirect_to root_url
		end
	end

	private

	def book_param
		params.require(booking).permit(:id, :book_date, :phone)
	end

end
