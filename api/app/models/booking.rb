class Booking < ActiveRecord::Base
    belongs_to :mechanic, class_name: 'User', foreign_key: 'mechanic_id'
    belongs_to :customer, class_name: 'User', foreign_key: 'customer_id'
    has_and_belongs_to_many :services
    has_and_belongs_to_many :parts
    belongs_to :service
    
    def total
      sum = 0
      sum = sum + service.price
      if (services!=nil)
        services.each do |s|
          sum = sum + s.price
        end
      end
      if (parts!=nil)
        parts.each do |p|
          sum = sum + p.price
        end
      end
      return sum
    end

    class Entity < Grape::Entity
        expose :id
        expose :date
        expose :status
        expose :service_id
        expose :customer_id
        expose :mechanic_id
        expose :vehicle_number_plate
        expose :vehicle_model
        expose :vehicle_brand
        expose :vehicle_engine
        expose :vehicle_type
        expose :service_ids
        expose :part_ids
        expose :comments
        expose :total
    end
    
end

