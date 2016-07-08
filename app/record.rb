require 'grape'
require 'json'

module API
  class Record < Grape::API

    resource :records do
      desc 'Return all records sorted by gender'
      get :gender do 
        file = File.read(File.expand_path('~/reverb.com/Project_1/gender.txt')).each_line.map { |line| JSON.parse(line) }
      end

      desc 'Return all records sorted by dob'
      get :dob do 
        file = File.read(File.expand_path('~/reverb.com/Project_1/dob.txt')).each_line.map { |line| JSON.parse(line) }
      end

      get :last_name do 
        file = File.read(File.expand_path('~/reverb.com/Project_1/last_name_asc.txt')).each_line.map { |line| JSON.parse(line) }
      end

      desc 'Create new record'
      params do
        requires :data, type: String, documentation: { eg: "aklsdfj" }
      end
      post '/' do
        file = File.open(File.expand_path('~/reverb.com/Project_1/customer_data_test.csv'), "a+"){ |f| f.write("\n" + params[:data]) }
      end
    end
  end
end