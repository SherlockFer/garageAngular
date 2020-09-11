module GarageAPI
  class Base < Grape::API
    #### FORMAT ####
    format :json

    #### ERRORS ####
    rescue_from :all do |e|
      error!({ status: 500, message: e.message , with: GarageAPI::Error }, 500)     
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      error!({ status: 404, message: "Not Found." , with: GarageAPI::Error }, 404)      
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      error!({ status: 400, message: e.message , with: GarageAPI::Error }, 400)
    end

    rescue_from ActiveRecord::RecordInvalid do |e| 
      messages = e.record.errors.full_messages 
      error!({ status: 400, message: messages.join(". ") , with: GarageAPI::Error }, 400)
    end 

    #### HELPERS ####
    helpers do
      def authenticate!
        begin
          token = request.headers['Authorization'].split(' ').last
          payload = JwtToken.decode(token)
          @current_user = User.find(payload['user_id'])
          rescue
          error!({ status: 401, message: "Unauthorized" , with: GarageAPI::Error }, 401)
        end
      end
        
      def current_user
        @current_user ||= authenticate!
      end
    end  

    #### ENDPOINTS ####
    mount GarageAPI::Users
    mount GarageAPI::Bookings
    mount GarageAPI::Services
    mount GarageAPI::Vehicles
    mount GarageAPI::Tokens

    #### APIDOCS ####
    add_swagger_documentation info: { title: "Garage API"},
                                      security_definitions: {
                                      api_key: { type: "apiKey", name: "Authorization",in: "header" }
                                    } 

  end
end