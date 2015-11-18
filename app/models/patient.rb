class Patient < ActiveRecord::Base
	belongs_to :user
	has_one :information
	# has_many :statistic
	has_many :appointments
	# has_many :diagnosis
	has_attached_file :image, styles: { small: "150x150>" }
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  	# accepts_nested_attributes_for :information, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :information, :allow_destroy => true

  	def fullname
  		lname + ', ' + fname + ' ' + mi
  	end
end
