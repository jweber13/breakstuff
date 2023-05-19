class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
  end

  def create
    @room = Room.find(params[:room_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.room = @room
    authorize(@booking)
    if @booking.save
      redirect_to rooms_path
    else
      render "rooms/show", status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    # we must authorize the booking using pundit after its created. we'll redirect to the bookings page after its deleted.
    authorize(@booking)
    @booking.destroy
    redirect_to bookings_path
  end

  private
  # strong params -> white listing the info coming from the form
  def booking_params
    params.require(:booking).permit(:date, :number_of_people)
  end
end
