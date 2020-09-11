class Service < ActiveRecord::Base

  class Entity < Grape::Entity
  expose :id
  expose :name
  expose :category
  expose :price
  end
end