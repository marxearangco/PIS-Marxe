class Service < ActiveRecord::Base
	belongs_to :product
	belongs_to :appointment
end
