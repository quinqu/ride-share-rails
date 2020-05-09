class TripsController < ApplicationController

  def index
    @trip = Trip.paginate(page: params[:page], per_page: 30)
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
      @trip = passenger.trips.new()
    else 
      @trip = Trip.new 
    end 
   
  end 

  def create
    time = Time.new 
    @trip = Trip.new
    @trip.passenger_id = params[:passenger_id]
    @trip.driver = Driver.find_available_driver
    @trip.date = "#{time.strftime("%d/%m/%Y")} #{time.strftime("%I:%M %p") }"
    @trip.rating = 0
    @trip.cost = Trip.trip_cost

    if @trip.save
      redirect_to passenger_path(params[:passenger_id])
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

end
