require 'spec_helper'
require 'airborne'

describe "GarageAPI::Users" do
  
  context'List users'do
    it 'Should return the list of all data in users' do
      get "/users" 
      expect_status 200
      expect_json_keys("data.*",[:email])
    end
    it 'Should return the list of customers' do
      get "/users?filter[role]=admin" 
      expect_status 200
      expect_json("data.*",role:'admin')
    end
    it 'Should return the list of admins' do
      get '/users?filter[role]=customer'
      expect_status 200
      expect_json("data.*",role: 'customer')
    end
    it 'Should return the list of mechanic' do
      get '/users?filter[role]=mechanic'
      expect_status 200
      expect_json("data.*",role: 'mechanic')
    end
  end

  context 'Create user' do
    it 'Should respond with sucess status and have correct data' do
      post "/users", { full_name: "Fermin", email: "fermin@garage.com", mobile: "0894756478", role: 'customer', password: "123456"}
      expect_status 201
      expect_json("data", role:'customer')
    end
  end

end