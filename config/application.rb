require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Survey
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.time_zone = 'Seoul'
    config.i18n.default_locale = :ko
    I18n.enforce_available_locales=true
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end
