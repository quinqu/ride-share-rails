class Driver < ApplicationRecord
  has_many :trips

  def total_earnings(driver_id)
    list_of_trips = Driver.find_by(id: driver_id).trips

    total_earnings = 0

    list_of_trips.each do |trip|
      total_earnings += trip.cost
    end

    return total_earnings
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

    return total_ratings / trips_count
  end
end
