class AddDashboardCountToHostels < ActiveRecord::Migration[5.0]
  def change
    add_column :hostels, :dashboard_count, :integer
  end
end
