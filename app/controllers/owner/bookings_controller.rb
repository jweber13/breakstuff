class Owner::BookingsController < ApplicationController
  def index
    # @owner_rooms = Room.where(user: current_user)
    # @rooms_bookings = Booking.all.each_with_object([]) do |booking, list|
    #   list << booking if booking.room.user == current_user # @owner_rooms.include?(booking.room)
    # end
    @rooms_bookings = policy_scope([:owner, Booking]).sort
  end

  def update

    @booking = Booking.find(params[:id])
    # need to authorize only within the owner scope / owner space
    authorize([:owner, @booking])
    @booking.status = params[:booking][:status]
    if @booking.save
      redirect_to owner_bookings_path
    end
  end
end
