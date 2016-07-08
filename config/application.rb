$:.unshift File.dirname(__FILE__)

require 'boot'

# Setup configuration settings
module Application
  include ActiveSupport::Configurable
end

Application.configure do |config|
  config.root = [File.dirname(__FILE__), ".."].join("/")
  config.env  = ActiveSupport::StringInquirer.new(ENV['RACK_ENV'] || "development")
end

Bundler.require :default, Application.config.env

# Load specific environments
specific_environment = "../environments/#{Application.config.env}.rb"
require specific_environment if File.exists? specific_environment

# simple method to require files by path
def include_files(path)
  files = "#{Application.config.root}#{path}/*.rb"
  Dir[files].each {|f| require f}
end

# Require public API files
include_files("/app/api")

# Require the base api file
require File.expand_path('../../app/record.rb', __FILE__)
