require 'rubygems'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

# Require our application.rb file for the API
require File.expand_path("../../config/application", __FILE__)

# Initialize an instance of the app
def app
  API::App
end

# Configure RSpec
RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end