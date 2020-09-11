require 'spec_helper'
require 'airborne'

def admin_token_header
  token = JwtToken.encode({ user_id: 1 })
  return { "Authorization" => "Token #{token}" }
end

describe "GarageAPI::Services" do
    
  context 'List Service Types' do
    it "Should return the list of Services Types" do
      get '/services', admin_token_header
      expect_status 200    
      expect_json_keys("data.*", [:id, :name, :price ])
    end
    it "Should return the list of services filtered by category" do
      get '/services/?filter[category]=base', admin_token_header
      expect_status 200    
      expect_json("data.*", category: "base")
    end
  end

  context 'Show Service' do
    it 'You must respond with success status and enter correct data' do
      get "/services/1",admin_token_header
      expect_status 200
      expect_json("data", id: 1)             
    end
  end
 
end