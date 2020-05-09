class FixTripsColumnTypes < ActiveRecord::Migration[6.0]
  def change
    change_column_default :trips, :rating, from: nil, to: 0
    change_column_null :trips, :rating, false 

    change_column :trips, :cost, :integer
    change_column_default :trips, :cost, from: nil, to: 0
    change_column_null :trips, :cost, false
  end
end
