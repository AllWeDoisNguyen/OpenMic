class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new booking_params
    @booking.save
    redirect_to root_path
  end

  private
  def booking_params
    params.require(:booking).permit(:comedian_id, :show_id)
  end

end
