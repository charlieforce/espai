class AddStartTimeAndEndTimeToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :start_time, :integer
    add_column :rooms, :end_time, :integer
  end
end
