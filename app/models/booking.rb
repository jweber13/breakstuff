class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates_presence_of :date, :number_of_people, :status
  validates :number_of_people, :status, numericality: { only_integer: true }
  enum :status, { requested: 0, accepted: 1, rejected: 2 }
end
