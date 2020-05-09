class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  def self.trip_cost 
    cents = rand(100..10000)
    return cents / 100
  end
    
end
