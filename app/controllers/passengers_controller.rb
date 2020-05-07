class PassengersController < ApplicationController
  def index
    @passenger = Passenger.all
  end

  def show 
    passenger_id = params[:id]
    @passenger= Passenger.find_by(id: passenger_id)
  
    if @passenger.nil?
      redirect_to passengers_path
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

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)

  end 
end
