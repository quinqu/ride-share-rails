class PreventNullAvailability < ActiveRecord::Migration[6.0]
  def change
    
    change_column_default :drivers, :available, from: nil, to: true
    change_column_null :drivers, :available, false 
  end
end
