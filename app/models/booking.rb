class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates_presence_of :date, :number_of_people, :status
  validates :number_of_people, numericality: { only_integer: true }
  enum :status, { requested: 0, accepted: 1, rejected: 2 }

  validate :different_users
  validate :compare_capacity

  private

  def different_users
    if user == room.user
      errors.add(:user, "can't be the same as the room's user")
    end
  end

  def compare_capacity
    if number_of_people > room.capacity
      errors.add(:number_of_people, "can't go over capacity")
    end
  end


end
