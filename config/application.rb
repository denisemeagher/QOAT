require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QOAT
  class Application < Rails::Application
    config.autoload_paths += %W(#{Rails.root}/app/modules)
    config.autoload_paths += %W(#{Rails.root}/app/modules/**)
    config.autoload_paths += %W(#{Rails.root}/lib)
    config.autoload_paths += %W(#{Rails.root}/lib/**)

    # Enable the asset pipeline
    config.assets.enabled = true
    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    config.assets.paths << Rails.root.join("vendor", "assets")
    # config.assets.initialize_on_precompile = false
    config.assets.precompile << /(^[^_\/]|\/[^_])[^\/]*$/

    config.before_initialize do
      dev = File.join(Rails.root, 'config', 'config.yml')
      YAML.load(File.open(dev)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(dev)
    end
  end
end
