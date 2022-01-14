class ApiController < ProtectedController
  respond_to :json
  before_action :oauth_authorize
  around_action :localize_timezone, if: :timezone_exists?
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private
  def resource_owner
    @resource_owner ||= User.find(doorkeeper_token.resource_owner_id)
  end

  def current_user
    @current_user = User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def timezone_exists?
    doorkeeper_token &&
      ActiveSupport::TimeZone[resource_owner.metadata['timezone'] || ''].present?
  end

  def localize_timezone(account = resource_owner)
    Time.use_zone(user.metadata['timezone']) { yield }
  end

  def not_found(exception)
    head 404
  end

  def oauth_authorize
    doorkeeper_authorize!
    set_locale if doorkeeper_token
  end

  def set_locale
    I18n.locale = if resource_owner.metadata['language']
                    resource_owner.metadata['language']
                  else
                    'es'
                  end
  end
end