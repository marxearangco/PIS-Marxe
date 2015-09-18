class AddColumnToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :appointment_date, :datetime
  end
end
