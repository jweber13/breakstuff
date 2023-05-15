class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates_presence_of :date, :number_of_people, :status
  validates :number_of_people, numericality: { only_integer: true }
end
