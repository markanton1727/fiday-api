require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FidayApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.time_zone = 'Monterrey'

    # The default locale is :en and all translations from config/locales/*.rb,yml
    # are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.enforce_available_locales = false
    config.i18n.available_locales = %w(es en ar)
    config.i18n.default_locale = 'es'
    config.i18n.fallbacks = {
        'en-au' => 'en', 'en-us' => 'en',
        'es-mx' => 'es', 'es-ar' => 'es', 'es-es' => 'es',
        'es-cl' => 'es', 'es-ec' =>'es', 'es-co' => 'es'
    }

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
  end
end
