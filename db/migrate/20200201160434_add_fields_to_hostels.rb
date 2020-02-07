class AddFieldsToHostels < ActiveRecord::Migration[5.0]
  def change
    add_column :hostels, :name, :string
    add_column :hostels, :location, :string
    add_column :hostels, :facilities, :string
    add_column :hostels, :images, :string
  end
end
