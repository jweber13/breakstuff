class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all
      scope.where(user:)
    end
  end

  def create?
    true
  end

  private

  def user_is_not_owner?
    # raise
    # record.user == user
  end
end
