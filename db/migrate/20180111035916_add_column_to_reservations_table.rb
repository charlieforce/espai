class AddColumnToReservationsTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :reservations, :start_time, :integer
  	add_column :reservations, :end_time, :integer
  	remove_column :reservations, :times, :integer
  end
end
