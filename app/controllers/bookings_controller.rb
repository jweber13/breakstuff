class BookingsController < ApplicationController

  # def new
  #   @booking = Booking.new
  #   @room = Room.find(params[:id])
  #   authenticate(@booking)
  # end

  def create
    @room = Room.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.room = @room
    authorize(@booking)

    if @booking.save
      redirect_to rooms_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # strong params -> white listing the info coming from the form
  def booking_params
    params.require(:booking).permit(:date, :number_of_people)
  end
end
