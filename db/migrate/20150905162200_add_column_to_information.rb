class AddColumnToInformation < ActiveRecord::Migration
  def change
    add_column :information, :homephone, :string
    add_column :information, :businessphone, :string
    add_column :information, :mobilephone, :string
    add_column :information, :email, :string
    add_column :information, :occupation, :string
    add_column :information, :spouse, :string
    add_column :information, :referredby, :string
    add_column :information, :dps, :datetime
  end
end
