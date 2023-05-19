class Review < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :content, presence: true
  # validate :different_users
  # validate :has_bookedx

  # private

  # def different_users
  #   if user == room.user
  #     errors.add(:user, "can't be the same as the room's user")
  #   end
  # end

  # def has_booked
  #   if room.bookings.all? { |booking| booking.user != user }
  #     errors.add(:user, "must have booked before")
  #   end
  # end
end
