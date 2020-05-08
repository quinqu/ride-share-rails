class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true, length: { in: 2..50 }
  validates :vin, presence: true 
  validates :available, presence: true

  def total_earnings(driver_id)
    list_of_trips = Driver.find_by(id: driver_id).trips

    total_earnings = 0
    fee = 1.65

    list_of_trips.each do |trip|
      drivers_portion = (trip.cost - fee) * 0.8
      total_earnings += drivers_portion
    end

    return total_earnings.round(2)
  end

  def average_rating(driver_id)
    list_of_trips = Driver.find_by(id: driver_id).trips
    trips_count = list_of_trips.count 

    if trips_count == 0
      return "This driver has no trips"
    end

    total_ratings = 0

    list_of_trips.each do |trip|
      total_ratings += trip.rating 
    end

    return (total_ratings.to_f / trips_count).round(2)
  end
end
