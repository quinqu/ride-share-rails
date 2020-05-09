class Passenger < ApplicationRecord
  has_many :trips
  
  validates :name, presence: true 
  validates :phone_num, presence: true 

  


  def total_passenger_cost(passenger)
    total_passenger_cost = 0 
    passenger = Passenger.find_by(id: passenger)

    passenger.trips.each do |trip| 
      total_passenger_cost += trip.cost
    end 
    return sprintf('%.2f', total_passenger_cost)
  end
  
end
