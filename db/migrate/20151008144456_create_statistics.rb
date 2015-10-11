class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.integer :patient_id
      t.integer :appointment_id
      t.string  :bp
      t.decimal :weight
      t.decimal :height
      t.datetime :date_gathered

      t.timestamps null: false
    end
    add_index :statistics, :patient_id,                unique: true
    add_index :statistics, :appointment_id,            unique: true

  end
end
