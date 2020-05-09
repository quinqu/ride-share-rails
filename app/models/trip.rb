class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  def self.trip_cost 
    return rand(3.0..999.9)
  end

  def self.delete_passenger(passenger_id)
    trip = Trip.find_by(passenger_id: passenger_id)
    trip.passenger_id = nil
    if trip.passenger_id == nil
      return true 
    else
      return false
    end 
  end 
    
end
