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

  def destroy?
    # make sure that the user is the owner of the booking
    user_is_owner?
  end

  private

  def user_is_owner?
    # the 'record' in this case is the booking, so 'record.user' is the owner of the booking. 'user' is the current user
    record.user == user
  end
end
