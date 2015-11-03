class Information < ActiveRecord::Base
  belongs_to :patient #, :dependent=> :destroy
  accepts_nested_attributes_for :patient, :allow_destroy => true

end
