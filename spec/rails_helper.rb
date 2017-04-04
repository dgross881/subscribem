# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_env'] ||= 'test'
require File.expand_path("../dummy/config/environment",  __FILE__)

require 'spec_helper'
require "rspec/rails"
require "capybara/rspec"
require "factory_girl"

Dir[File.dirname(__FILE__)  + "/support/**/*rb"].each { |f| require f }
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

FactoryGirl.find_definitions

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryGirl::Syntax::Methods

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.include Rails.application.routes.url_helpers
  config.filter_rails_from_backtrace!
  config.include Capybara::DSL
end
