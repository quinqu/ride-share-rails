class TripsController < ApplicationController

  def index

  @trip = Trip.paginate(page: params[:page], per_page: 30).all.order(date: :asc)
  
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

    driver = Driver.find_available_driver

    if driver.nil?
      flash[:error] = "There are no available drivers at the moment"
      redirect_to passenger_path(params[:passenger_id])
    else

      time = Time.new 
      @trip = Trip.new
      @trip.passenger_id = params[:passenger_id]
      @trip.driver = driver

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
  end 

  def edit 
    @trip = Trip.find_by(id: params[:id])

    if @trip.nil? 
      head :not_found
      return 
    end 
  end 


  def update
    @trip = Trip.find_by(id: params[:id])
    
    if @trip.nil? 
      head :not_found
      return 
    elsif @trip.update(rating: update_params[:rating])
      redirect_to trip_path(@trip)
      return 
    else 
      render :edit 
      return
    end 
  end 

  private 

  def update_params
    params.require(:trip).permit(:rating)
  end


end
