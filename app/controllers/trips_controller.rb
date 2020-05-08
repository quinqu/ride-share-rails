class TripsController < ApplicationController

  def index
    @trip = Trip.all
  end

  def show 
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
  
    if @trip.nil?
      redirect_to trips_path
    end 
  end 

  def new
    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trip = passenger.trips.new
    else 
      @trip = Trip.new 
    end 
  end 

  def create
    trip = Trip.create(trips_params)

    if trip.save
      redirect_to trip_path
      return 
    else 
      render :new 
      return 
    end 
  end 

  def edit 
    @trip = Trip.find_by(id: params[:id])

    if @trip.nil? 
      head :not_found
      return 
    end 
  end 


  def update
    trip = Trip.find_by(id: params[:id])

    if trip.nil? 
      head :not_found
      return 
    elsif trip.update(trips_params)
      redirect_to trip_path
      return 
    else 
      render :edit 
      return
    end 
  end 

  private 

  def trips_params
    return {
      "date": DateTime.now().to_s, 
      "rating": 0, 
      "cost": Trip.trip_cost, 
      "driver_id": nil,
      "passenger_id": params[:passenger_id]
    }
  end 


end
