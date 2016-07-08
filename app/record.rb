require 'grape'
require_relative 'file_manager'

module API
  class Record < Grape::API

    resource :records do
      desc 'Return all records sorted by gender'
      get :gender do 
        FileManager.file_reader('~/reverb.com/Project_1/gender.txt')
      end

      desc 'Return all records sorted by dob'
      get :dob do 
        FileManager.file_reader('~/reverb.com/Project_1/dob.txt')
      end

      desc 'Return all records sorted by last name ascending'
      get :last_name do 
        FileManager.file_reader('~/reverb.com/Project_1/last_name_asc.txt')
      end

      desc 'Create new record'
      params do
        requires :data, type: String, documentation: { eg: "aklsdfj" }
      end
      post '/' do
        FileManager.file_writer('~/reverb.com/Project_1/customer_data_test.csv', params[:data])
      end
    end
  end
end