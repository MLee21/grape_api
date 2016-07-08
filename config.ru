$:.unshift File.expand_path "..", __FILE__

require "rack"
require "grape"
require "app/record"

run API::Record