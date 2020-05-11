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
          phone_num: nil
        }
      }


      expect {
        post passengers_path, params: new_passenger
      }.must_differ "Passenger.count", 0
    end 
  end

  describe "edit" do
    it "can get to the edit page of valid id" do
      new_passenger = {
        passenger: {
          name: "bernie",
          phone_num: "1-800-cool"
        }
      }

        post passengers_path, params: new_passenger
        passenger = Passenger.find_by(name: new_passenger[:passenger][:name])
        get edit_passenger_path(passenger.id)
        must_respond_with :ok
    end

  
    it "will respond with redirect if nonexistent passenger" do
      get edit_passenger_path(-100)
      
      must_respond_with :not_found
    end
  end

  describe "update" do
    it "will update el passenger " do 
      Passenger.create(name: "hehehe", phone_num: "1738")

      passenger_test = {
        passenger: {
          name: "updated name",
          phone_num: "200000000"
        }
      }

      passenger = Passenger.first

  
      patch passenger_path(passenger.id), params: passenger_test
      
      
    
      expect(Passenger.first.name).must_equal passenger_test[:passenger][:name]
      expect(Passenger.first.phone_num).must_equal passenger_test[:passenger][:phone_num]
    end 
  end

  describe "destroy" do
    it "will delete passenger" do
      Passenger.create(name: "to delete", phone_num: "DELETE ME")

      passenger = Passenger.first
  

      expect{delete passenger_path(Passenger.first.id)}.must_differ "Passenger.count", -1
    end
  end
end
