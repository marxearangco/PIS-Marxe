class Patient < ActiveRecord::Base
	belongs_to :user
	has_many :diagnosis
	has_attached_file :image, styles: { medium: "300x300#", small: "150x150>" }
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
