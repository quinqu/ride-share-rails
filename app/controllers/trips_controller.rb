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
    @trip = Trip.new 
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
    return params.require(:trip).permit(:date, :rating, :cost, :passenger_id, :driver_id)
  end 
end
