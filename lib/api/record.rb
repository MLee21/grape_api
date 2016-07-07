module API
  class Record < Grape::API
    resource :records do
      desc 'Return all records sorted by gender'
      get :gender do 
        { status: 'ok'}
      end
    end
  end
end