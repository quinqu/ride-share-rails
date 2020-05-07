class DriversController < ApplicationController


  def index
    @driver = Driver.all
  end

  def show 
    driver_id = params[:id]
    @driver = Driver.find_by(id: driver_id)
  
    if @driver.nil?
      redirect_to drivers_path
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

  def driver_params
    return params.require(:driver).permit(:name, :vin, :available)

  end 


end
