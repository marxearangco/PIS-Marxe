class AddColumnModeToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :mode, :string
  end
end
