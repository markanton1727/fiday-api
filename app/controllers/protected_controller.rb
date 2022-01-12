class ProtectedController < ApplicationController
  include Pundit

  after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def pundit_user
    resource_owner
  end

  private
  def user_not_authorized
    head 403
  end
end