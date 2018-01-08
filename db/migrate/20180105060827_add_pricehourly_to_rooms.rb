class AddPricehourlyToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :pricehourly, :integer
  end
end
