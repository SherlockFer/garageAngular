class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true

  class Entity < Grape::Entity
    expose :id
    expose :full_name
    expose :mobile
    expose :email
    expose :role
  end
  
end