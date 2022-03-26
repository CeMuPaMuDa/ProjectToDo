require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require 'generators/slim/scaffold/scaffold_generator.rb'

Bundler.require(*Rails.groups)

module ProjectToDo
  class Application < Rails::Application
    config.load_defaults 6.1
    config.i18n.available_locales = %i[en ru uk]
    config.i18n.default_locale = :ru
    config.time_zone = 'Kyiv'
    config.paths.add Rails.root.join('lib').to_s, eager_load: true

    initializer 'load_slim_ext' do
      ActiveSupport.on_load(:after_initialize) do
        Slim::Generators::ScaffoldGenerator.prepend Slim::SlimExt
      end
    end

    config.generators do |g|
      g.orm              :active_record
      g.template_engine  :erb
      g.system_tests     nil
      g.test_framework   nil
      g.helper           false
      g.stylesheets      false
      g.javascripts      false
    end
  end
end
