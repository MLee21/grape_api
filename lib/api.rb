require 'grape'

module API
  class App < Grape::API
    format :json

    mount API::Record

  end
end