require_relative "boot"

require "rails/all"
require "dotenv/load"

Bundler.require(*Rails.groups)

module Dating
  class Application < Rails::Application
    config.load_defaults 7.0

    config.active_storage.service = :local
  end
end
