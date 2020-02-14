class AddPriceToHostels < ActiveRecord::Migration[5.0]
  def change
    add_column :hostels, :price, :integer
  end
end
