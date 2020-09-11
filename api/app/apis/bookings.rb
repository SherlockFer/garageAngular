module GarageAPI
    class Bookings < Grape::API
  
      resource :bookings do

        before do 
          authenticate!
        end
  
        params do
          optional :filter, type: Hash do
            optional :status, type: String, values: ['booked', 'in_service', 'fixed', 'collected', 'unrepairable']
            optional :service_type_id, type: Integer
          end
          optional :limit, type: Integer
        end
        get "/" do 
          if (@current_user.role=="admin")
            bookings = Booking.where(params[:filter]).order(date: :desc).limit(params[:limit])
          else
            params[:filter] ||= {} # if params[:filter] is nil then assign it an empty hash
            params[:filter][:customer_id] = @current_user.id
            bookings = Booking.where(params[:filter]).order(date: :desc).limit(params[:limit])
          end  
          present :data, bookings.all
        end

        get '/:id' do
          present :data, Booking.find(params[:id])
        end

        params do
          requires :service_id, type: Integer
          requires :date, type: Date
          requires :vehicle_type, type: String, values: ['car', 'motorbike', 'small_van', 'small_bus']   
          optional :vehicle_number_plate, type: String
          optional :vehicle_model, type: String
          optional :vehicle_brand, type: String
          optional :vehicle_engine, type: String        
          optional :comments, type: String
        end

        post "/" do
          booking = Booking.new(params)
          booking.status = "booked"
          booking.customer_id = @current_user.id    
          booking.save      
          present :data, booking
        end
        
        params do
          requires :service_id, type: Integer
          requires :date, type: Date
          requires :vehicle_type, type: String, values: ['car', 'motorbike', 'small_van', 'small_bus', 'otros']   
          optional :vehicle_number_plate, type: String
          optional :vehicle_model, type: String
          optional :vehicle_brand, type: String
          optional :vehicle_engine, type: String        
          optional :comments, type: String
          optional :part_ids, type: Array[Integer]
          optional :service_ids, type: Array[Integer]
        end

        put "/:id" do          
          booking = Booking.find(params[:id])
          booking.update_attributes(params)
          present :data, booking
        end  
      
        delete "/:id" do
          Booking.find(params[:id]).destroy
          body false
        end  

      end #resource
      
    end #class
    
end #module