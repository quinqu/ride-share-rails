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

      # #post trips_path, params: Trip.create
      # trip = Trip.new
      # post trips_path, params: :trip
     
      # expect(Trip.count).must_equal 1

    end 
  end

  describe "edit" do
    it "will get valid trip" do 


    end 
  end

  describe "update" do
    it "will edit rating" do 

    end 
  end

end
