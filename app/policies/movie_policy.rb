class MoviePolicy < ApplicationPolicy
  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
