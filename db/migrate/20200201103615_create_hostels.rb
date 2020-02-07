class CreateHostels < ActiveRecord::Migration[5.0]
  def change
    create_table :hostels do |t|
      t.text :description
      t.references :user, foriegn_key: true, unique: true
      t.timestamps
    end
  end
end
