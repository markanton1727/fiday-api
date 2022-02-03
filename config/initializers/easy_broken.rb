EasyBroker.configure do |config|
  config.api_key = Rails.application.secrets.easy_broken_api_key

  # Optionally change the root API URL
  config.api_root_url = Rails.application.secrets.easy_broken_host
end