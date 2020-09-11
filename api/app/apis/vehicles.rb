module GarageAPI
    class Vehicles < Grape::API
      namespace :vehicles do
        resource :parts do
          get "/" do
            present :data, Part.all
          end

          get '/:id' do
            present :data, Part.find(params[:id])
          end
        end #resource
      end # ns

    end #class

  end #