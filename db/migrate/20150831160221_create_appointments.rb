class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :patient, index: true
      t.references :user, index: true
      t.string :purpose
      t.string :result
      t.text :remarks

      t.timestamps
    end
  end
end
