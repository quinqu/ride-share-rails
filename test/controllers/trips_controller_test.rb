require "test_helper"

describe TripsController do
  let (:trip) {
    Trip.create
  }

  describe "index" do 
    it "can get a list of all trips" do 

      get trips_path 

      must_respond_with :success 
    end 
  end 

  describe "show" do

    it "can get trip" do 
      passenger = Passenger.create(name: "Nina", phone_num: "12345")
      driver = Driver.create(name: "Anna", vin: "qwert123", available: true)
      new_trip = Trip.create(date: "today", rating: 0, cost: Trip.trip_cost, driver_id: driver.id, passenger_id: passenger.id)

      # puts "trip id is #{trip.id}"
      get trip_path(new_trip.id)
      must_respond_with :success
    end 

    it "will redirect for invalid trip" do 
      get trip_path(-1)
      must_respond_with :redirect

    end 
  end

  describe "create" do
    it "can request new trip" do 

      passenger = Passenger.create(name: "Nina", phone_num: "12345")
      driver = Driver.create(name: "Anna", vin: "qwert123", available: true)

      trip_hash = {
        trip: {
          date: "today",
          rating: 0,
          cost: Trip.trip_cost,
          driver_id: driver.id,
          passenger_id: passenger.id
        }
      }

      # count_before = Trip.count 
      # puts "count before = #{count_before}"
      # post passenger_trips_path(passenger.id), params: trip_hash

      # count_after = Trip.count
      # puts "count after = #{count_after}"

      expect {
        post passenger_trips_path(passenger.id), params: trip_hash
      }.must_differ "Trip.count", 1

    end 
  end

  describe "edit" do
    it "responds with success when getting to the edit trip's rating page" do 

      passenger = Passenger.create(name: "Nina", phone_num: "12345")
      driver = Driver.create(name: "Anna", vin: "qwert123", available: true)
      new_trip = Trip.create(date: "today", rating: 0, cost: Trip.trip_cost, driver_id: driver.id, passenger_id: passenger.id)

      get edit_trip_path(new_trip.id)
      must_respond_with :success

    end 
  end

  describe "update" do
    it "will edit rating" do 

      passenger = Passenger.create(name: "Nina", phone_num: "12345")
      driver = Driver.create(name: "Anna", vin: "qwert123", available: true)
      new_trip = Trip.create(date: "today", rating: 0, cost: Trip.trip_cost, driver_id: driver.id, passenger_id: passenger.id)

      new_trip_id = new_trip.id

      new_trip_hash = {
        trip: {
          rating: 5
        }
      }

      expect {
        patch trip_path(id: new_trip_id), params: new_trip_hash
      }.must_differ "Trip.count", 0

      must_redirect_to trip_path(new_trip_id)
      expect(Trip.find_by(id: new_trip_id).rating).must_equal new_trip_hash[:trip][:rating]

    end 
  end

end
