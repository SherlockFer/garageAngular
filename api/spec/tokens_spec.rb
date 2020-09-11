require 'spec_helper'
require 'airborne'



describe "GarageAPI::Tokens" do

  context 'Create token' do
    it 'should return valid token' do
      post "/token", { email: "admin@garage.com", password: "123456"}
      expect_status 201
      expect_json_types(token: :string)
    end

    it 'should return unauthorized error ' do
      post "/token", { email: "test@garage.com", password: "test"}
      expect_status 401
      
    end
  end

end