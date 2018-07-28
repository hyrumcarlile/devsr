require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Silvertuna
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # So that we can leave our devise views where they are
    # paths.app.views << 'app/views/devise'

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.assets.enabled = true

    # Include the authenticity token in remote forms.
    config.action_view.embed_authenticity_token_in_remote_forms = true

  end
end
