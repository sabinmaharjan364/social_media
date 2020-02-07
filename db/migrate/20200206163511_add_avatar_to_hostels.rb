class AddAvatarToHostels < ActiveRecord::Migration[5.0]
  def change
    add_column :hostels, :avatar, :string
  end
end
