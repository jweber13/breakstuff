class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all
      scope.where(user:)
    end
  end

  def show?
    record.user == user
  end

  def create?
    true
  end

  def update?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.room.user == user
  end
end
