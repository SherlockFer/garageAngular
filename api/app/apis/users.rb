module GarageAPI
  class Users < Grape::API

    resource :users do

      params do
        optional :filter, type: Hash do
          optional :role,  type: String, values: ['admin','mechanic','customer'] 
        end
        optional :limit, type: Integer
      end
      get "/" do
        users = User.where(params[:filter]).limit(params[:limit])
        present :data, users.all
      end


      get '/:id' do
        present :data, User.find(params[:id])
      end


      params do
        requires :full_name, type: String
        requires :mobile, type: String
        requires :email, type: String
        requires :password, type:String
      end
      post "/" do
        user = User.new(params)
        user.role = "customer"
        # exception try record but it not posible launch exception invalid record
        user.save! 
        present :data, user.reload
      end

      params do
        requires :full_name, type: String
        requires :mobile, type: String
      end
      put "/:id" do
        user = User.find(params[:id])
        user.update_attributes(params)
        present :data, user 
      end  


      delete "/:id" do
        User.find(params[:id]).destroy
        body false
      end  

    end
  end
end