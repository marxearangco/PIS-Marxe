class Patient < ActiveRecord::Base
	belongs_to :user
	has_one :information
	has_many :statistic
	has_many :appointment
	accepts_nested_attributes_for :information
	has_many :diagnosis
	has_attached_file :image, styles: { medium: "200x150#", small: "150x150>" }
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  	def fullname
  		lname + ', ' + fname + ' ' + mi
  	end
end
