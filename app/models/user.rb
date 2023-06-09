class User < ApplicationRecord
  has_many :bookings
  has_many :rooms
  has_many :bookings_as_owner, through: :rooms, source: :bookings

  validates :username, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
