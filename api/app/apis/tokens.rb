module GarageAPI
  class Tokens < Grape::API
    params do
      requires :email, type: String
      requires :password, type: String
    end
    post "/token" do
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        present token: JwtToken.encode({user_id: user.id, role: user.role, full_name: user.full_name})
      else
        error!({ status: 401, message: "Invalid email/password combination" , with: GarageAPI::Error }, 401)      
      end
    end
    
  end #class
  
end #module

