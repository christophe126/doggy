class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user_id: user)
    end
  end
  def index?
    true
  end

  def create?
    true
  end

  def update?
    true
  end
end
