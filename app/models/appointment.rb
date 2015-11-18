class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :user
  has_many :services
  has_many :products, through: :services
end

