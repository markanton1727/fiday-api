class UserPolicy < ApplicationPolicy
  def index?
    everyone_can
  end
end
