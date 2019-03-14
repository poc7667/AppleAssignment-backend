require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AppleProj
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.autoload_paths += %W( lib/ )
    # config.action_controller.permit_all_parameters = true
    # ActiveRecord::Base.logger = Logger.new STDOUT
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # config.middleware.insert_before 0, Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '*',
    #              :headers => :any,
    #              :methods => [:get, :post, :delete, :put, :options, :head],
    #              :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
    #              :max_age => 0
    #   end
    # end



    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
