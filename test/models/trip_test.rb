require "test_helper"

describe Trip do
  let(:new_trip) {
    passenger = Passenger.create(name: "Nina", phone_num: "12345")
    driver = Driver.create(name: "Anna", vin: "qwert123", available: true)
    Trip.create(date: "today", rating: 0, cost: Trip.trip_cost, driver_id: driver.id, passenger_id: passenger.id)
  }

  it "can be instantiated" do
    expect(new_trip.valid?).must_equal true
  end

  it "will have the required fields" do
    new_trip.save 
    trip = Trip.first 
    [:date, :rating, :cost, :driver_id, :passenger_id].each do |field|
      expect(trip).must_respond_to field
    end
  end

  describe "relationships" do
    
    it "can set the driver through 'driver'" do 
      passenger = Passenger.create(name: "Nina", phone_num: "12345")
      driver = Driver.create(name: "Anna", vin: "qwert123", available: true)
      trip = Trip.new(date: "today", rating: 0, cost: Trip.trip_cost)

      trip.driver = driver 

      expect(trip.driver_id).must_equal driver.id
    end

    it "can set the driver through 'driver_id'" do 
      passenger = Passenger.create(name: "Nina", phone_num: "12345")
      driver = Driver.create(name: "Anna", vin: "qwert123", available: true)
      trip = Trip.new(date: "today", rating: 0, cost: Trip.trip_cost)

      trip.driver_id = driver.id

      expect(trip.driver).must_equal driver 
    end

    it "can set the passenger through 'passenger'" do 
      passenger = Passenger.create(name: "Nina", phone_num: "12345")
      driver = Driver.create(name: "Anna", vin: "qwert123", available: true)
      trip = Trip.new(date: "today", rating: 0, cost: Trip.trip_cost)

      trip.passenger = passenger 

      expect(trip.passenger_id).must_equal passenger.id
    end

    it "can set the passenger through 'passenger_id'" do 
      passenger = Passenger.create(name: "Nina", phone_num: "12345")
      driver = Driver.create(name: "Anna", vin: "qwert123", available: true)
      trip = Trip.new(date: "today", rating: 0, cost: Trip.trip_cost)

      trip.passenger_id = passenger.id

      expect(trip.passenger).must_equal passenger 
    end
  end

<<<<<<< HEAD
  # Tests for methods you create should go here
  describe "custom methods" do
    it "can provide a random cost" do 
      passenger = Passenger.create(name: "Nina", phone_num: "12345")
      driver = Driver.create(name: "Anna", vin: "qwert123", available: true)
      trip = Trip.new(date: "today", rating: 0, cost: Trip.trip_cost)

      trip[:cost].must_be_instance_of Float
    end 

=======
  describe "validations" do
    before do 
      passenger = Passenger.create(name: "Nina", phone_num: "12345")
      driver = Driver.create(name: "Anna", vin: "qwert123", available: true)
      @trip = Trip.new(date: "today", rating: 0, cost: Trip.trip_cost, driver_id: driver.id, passenger_id: passenger.id)
    end

    it "is valid when all fields are present" do 
      result = @trip.valid?
      
      expect(result).must_equal true
    end

    it "is invalid without a passenger_id" do 
      # Arrange
      @trip.passenger_id = nil 

      # Act
      result = @trip.valid?

      # Assert
      expect(result).must_equal false
    end

    it "is invalid without a driver_id" do 
    
      @trip.driver_id = nil 

      result = @trip.valid?

      expect(result).must_equal false
    end
  end

  # Tests for methods you create should go here
  describe "custom methods" do
>>>>>>> 65db2dd28acaa697da9d56d2ca31f3c6242488a4
  end
end
