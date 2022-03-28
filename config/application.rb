require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Proj
  class Application < Rails::Application
    config.load_defaults 7.0
    config.i18n.available_locales = %i[en ru uk]
    config.i18n.default_locale = :uk
    config.time_zone = 'Kyiv'
    config.paths.add Rails.root.join('lib').to_s, eager_load: true
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml')]
    config.generators do |g|
      g.orm              :active_record
      g.template_engine  :slim
      g.system_tests     nil
      g.test_framework   nil
      g.helper           false
      g.stylesheets      false
      g.javascripts      false
    end
  end
end
