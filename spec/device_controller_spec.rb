require 'spec_helper'

ENV['RACK_ENV'] = 'test'

describe 'Device UI' do

  include Rack::Test::Methods

  def app
    DeviceController.new
  end

  context "should go to homepage" do

    it "receive a status code of 200" do
      get "/"
      expect(last_response.status).to eq 200
    end

    it "includes the word devices on the page" do
      get "/"
      expect(last_response.body).to include("Devices")
    end
  end

  context "should go to the show page of 'ct' " do

    it "recieve information as a string" do
      get "/ct"
      expect(last_response.body).to be_kind_of(String)
    end

    it "includes 'Legacy Legato CT transmitter' in the body" do
      get "/ct"
      expect(last_response.body).to include("Legacy Legato CT transmitter")
    end
  end

  context "should go to the show page of 'CELLO' " do

    it "recieve information as a string" do
      get "/CELLO"
      expect(last_response.body).to be_kind_of(String)
    end

    it "includes 'Cosy display, R1' in the body" do
      get "/CELLO"
      expect(last_response.body).to include("Cosy display, R1")
    end
  end

  context "should be able to post new devices" do

    it "read the inputs and post into the database" do
      post "/new"
      expect(last_response.body).to include("New Device")
    end

    it "redirects back to homepage" do
      post "/new"
      follow_redirect!
      expect(last_request.path).to eq('/')
    end
  end

  context "should be able to update information on the devices" do

    it "reads new information and updates the database" do
      put "/:name/edit", :name => "iphone"
      expect(last_response.body).to include("Edit device")
    end
  end

end
