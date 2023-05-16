class Room < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_one_attached :photo

  validates_presence_of :name, :address, :story, :description, :capacity, :price
  validates :price, :capacity, numericality: { only_integer: true }
end
