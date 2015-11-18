class Product < ActiveRecord::Base
  has_many :services
  has_many :appointments, through: :services
end
