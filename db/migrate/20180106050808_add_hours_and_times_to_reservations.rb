class AddHoursAndTimesToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :hours, :integer
    add_column :reservations, :times, :string
  end
end
