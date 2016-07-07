require 'spec_helper'

describe API::App do 
  describe 'GET /records/gender' do
    it "returns ok" do 
      get "/records/gender", {}, {}
      expect(last_response.status).to eq(200)
      expect(last_response.body).to be_json_eql({'status' => 'ok'}.to_json)
    end
  end
end