require 'spec_helper'
require 'airborne'

def customer_token_header
  token = JwtToken.encode({ user_id: 4 })
  return { "Authorization" => "Token #{token}" }
end

# Follow the next example
# https://github.com/azelenets/video-trimmer-api/blob/05ebbb76e6811ce7710bbbaaf2bf4b9e749b14cc/spec/controllers/v1/movies_controller_spec.rb

describe "GarageAPI::Bookings" do
    
  context 'List bookings' do
    it "Should return the list of bookings" do
      get '/bookings', customer_token_header
      expect_status 200    
      expect_json_keys("data.*", [:id, :date, :status, :comments ])
    end
    it "Should return the list of bookings by limit" do
      get '/bookings?limit=2', customer_token_header
      expect_status 200    
      expect_json_sizes("data", 2)
    end
    it "Should return the list of bookings filtered by status" do
      get '/bookings?filter[status]=booked',customer_token_header
      expect_status 200    
      expect_json("data.*", status: "booked")
    end
    it "Should return the list of bookings filtered by service_type" do
      get '/bookings?filter[service_id]=1',customer_token_header
      expect_status 200    
      expect_json("data.*", service_id: 1)
    end
  end
 
  context 'Success booking' do
    it 'Should respond with sucess status and have correct data' do
      post "/bookings", { date: "2020-01-01", service_id: 1, vehicle_type: "car" },customer_token_header
      expect_status 201
      expect_json("data", status: "booked")
    end
  end

  context 'Failed booking' do
    it 'Should respond with client error status if date is not specify' do
      post "/bookings", { vehicle_number_plate: "vehiclex number repair" },customer_token_header
      expect_status 400
      expect_json("status", 400)          
    end
  end

  context 'Show booking' do
    it 'You must respond with success status and enter correct data' do
      get "/bookings/1",customer_token_header
      expect_status 200
      expect_json("data", id: 1)             
    end
  end
  
  context 'Delete booking' do
    it 'Should respond with sucess status' do
      delete '/bookings/1',{},customer_token_header
      expect_status 204            
    end
  end
 
end