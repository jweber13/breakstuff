class Review < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :content, presence: true

  private

  def different_users
    if user == room.user
      errors.add(:user, "can't be the same as the room's user")
    end
  end
end
