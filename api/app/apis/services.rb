module GarageAPI
    class Services < Grape::API
      before do 
          authenticate!
      end
     
      resource :services do
        params do
          optional :filter, type: Hash do
            optional :category, type: String, values: ['base', 'extra']
          end
        end
        get "/" do
          services = Service.where(params[:filter])
          present :data, services.all
        end

        get '/:id' do
          present :data, Service.find(params[:id])
        end
      end #resource

    end #class

  end #