class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.references :patient, index: true
      t.string :religion
      t.string :status
      t.string :sex
      t.integer :age
      t.date :bday
      t.string :height
      t.string :weight

      
    end
  end
end
