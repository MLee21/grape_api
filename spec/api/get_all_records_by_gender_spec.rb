require 'spec_helper'

describe API::Record do 
  describe 'GET' do

    it "should return records sorted by gender" do 
      get "records/gender"
      expect(last_response.status).to eq(200)
      expect(last_response.body.slice(0..152)).to eq("[[\"{\\\"date_of_birth\\\":\\\"10/18/1977\\\",\\\"favorite_color\\\":\\\"Violet\\\",\\\"first_name\\\":\\\"Brenda\\\",\\\"gender\\\":\\\"Female\\\",\\\"id\\\":1,\\\"last_name\\\":\\\"Washington\\\"}")
    end

    it "should return records sorted by birth date" do 
      get "records/dob"
      expect(last_response.status).to eq(200)
      expect(last_response.body.slice(0..150)).to eq("[[\"{\\\"date_of_birth\\\":\\\"03/06/1971\\\",\\\"favorite_color\\\":\\\"Yellow\\\",\\\"first_name\\\":\\\"Nancy\\\",\\\"gender\\\":\\\"Female\\\",\\\"id\\\":40,\\\"last_name\\\":\\\"Thompson\\\"}")
    end

    it "should return records sorted by last name ascending" do 
      get "records/last_name"
      expect(last_response.status).to eq(200)
      expect(last_response.body.slice(0..147)).to eq("[[\"{\\\"date_of_birth\\\":\\\"07/20/1983\\\",\\\"favorite_color\\\":\\\"Pink\\\",\\\"first_name\\\":\\\"Diana\\\",\\\"gender\\\":\\\"Female\\\",\\\"id\\\":27,\\\"last_name\\\":\\\"Andrews\\\"}")
    end
  end

  describe 'POST' do 
    it "should post a new record to the file db that is comma delimited" do 
      params = { params: "51,Smith,Jim,Male,Maroon,05/03/1983"}
      post "records", params.to_json, {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}
      expect(last_response.status).to eq(201)
    end

    it "should post a new record to the file db that is pipe delimited" do 
      params = { data: "52|Sanders|Sally|Female|Lavender|11/20/1975"}
      post "records", params.to_json, {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}
      expect(last_response.status).to eq(201)
    end
  end

end