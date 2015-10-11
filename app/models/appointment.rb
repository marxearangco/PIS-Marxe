class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :user
  has_one :statistic
end
