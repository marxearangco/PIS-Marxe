class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :appointment_id
      t.integer :product_id

    end
  end
end
