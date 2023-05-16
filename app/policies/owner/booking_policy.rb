class Owner::BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # puts scope
      # scope.all
      scope.all.each_with_object([]) do |booking, list|
        list << booking if booking.room.user == user
      end
    end
  end
end
