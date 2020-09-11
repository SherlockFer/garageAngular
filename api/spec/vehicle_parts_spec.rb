require 'spec_helper'
require 'airborne'

describe "GarageAPI::Vehicles" do
    
  context 'List Vehicules Parts' do
    it "Should return the list of Vehicles Parts" do
      get '/vehicles/parts'
      expect_status 200    
      expect_json_keys("data.*", [:id, :name, :price ])
    end
  end

  context 'Show Parts' do
    it 'You must respond with success status and enter correct data' do
      get "/vehicles/parts/1"
      expect_status 200
      expect_json("data", id: 1)             
    end
  end
 
end