class Room < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews
  has_one_attached :photo

  validates_presence_of :name, :address, :story, :description, :capacity, :price
  validates :price, :capacity, numericality: { only_integer: true }

  include PgSearch::Model
  # multisearchable against: [:name, :description]

  pg_search_scope :search_by_attributes,
    against: [ :name, :description, :story, :address ],
    using: {
      tsearch: { prefix: true }
    }
end
