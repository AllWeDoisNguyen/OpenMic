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
    params.require(:booking).permit(:comedian_id, :show_id, :user_id)
  end

end
#booking.show.build(booking_params) probably to replace booking.new
#So the booking makes the association with the show. 
