require_relative 'boot'

require 'rails/all'
require_relative '../app/middleware/asset_proxy'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBlogApi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.middleware.use AssetProxy
    ActiveModelSerializers.config.key_transform = :camel_lower
  end
end
