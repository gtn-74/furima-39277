class Address < ApplicationRecord
  include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number
  
  has_one :address
end
