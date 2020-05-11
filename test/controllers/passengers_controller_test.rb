require "test_helper"

describe PassengersController do
  let (:passenger) {
    Passenger.create name: "quin", phone_num: "2063560000"
  }



  describe "index" do
    it "can get passenger index page" do 
      get passengers_path 

      must_respond_with :success 
    end 

  end

  describe "show" do
    it "can show a valid passenger" do 
      get passenger_path(passenger.id)

      must_respond_with :success 
    end 

    it "will redirect for a non-existent passenger" do 
      get passenger_path(-6)
      
      must_respond_with :redirect
    end 
    
  end

  describe "new" do
    it "can get the new task page" do 
      get new_passenger_path 

      must_respond_with :success

    end 
  end

  describe "create" do
    it "can create a new passenger" do 
      new_passenger = {
        passenger: {
          name: "bernie",
          phone_num: "1-800-cool"
        }
      }

      expect {
        post passengers_path, params: new_passenger
    }.must_differ "Passenger.count", 1

    #Arrage
    new_pass = Passenger.find_by(name: new_passenger[:passenger][:name])
    #Act and Assert
    expect(new_pass.phone_num).must_equal new_passenger[:passenger][:phone_num]
    
    must_redirect_to passenger_path(new_pass.id)
    end 

    it "does not create a passenger with empty inputs" do 
      new_passenger = {
        passenger: {
          name: "random dude",
          phone_num: "12345"
        }
      }


      expect {
        post passengers_path, params: new_passenger
      }.must_differ "Passenger.count", 0
    end 
  end

  describe "edit" do
    # Your tests go here
  end

  describe "update" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end
