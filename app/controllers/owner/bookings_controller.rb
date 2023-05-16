class Owner::BookingsController < ApplicationController
  def index
    # @owner_rooms = Room.where(user: current_user)
    # @rooms_bookings = Booking.all.each_with_object([]) do |booking, list|
    #   list << booking if booking.room.user == current_user # @owner_rooms.include?(booking.room)
    # end
    @rooms_bookings = policy_scope([:owner, Booking])
  end

  def update
    # @rooms_bookings = policy_scope([:owner, Booking])
  end
end
