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


  end 

  def create


  end 

  def edit 

  end 


  def update


  end 

  private 

  def trips_params
    return params.require(:trip).permit(:date, :rating, :cost, :passenger_id, :driver_id)
  end 
end
