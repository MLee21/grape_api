$:.unshift File.expand_path "..", __FILE__

require "rack"
require "grape"
require "lib/app"

run API::App