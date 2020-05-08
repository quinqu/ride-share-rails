class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  def trip_cost 
    return rand(3.0..999.9)
  end 
end
