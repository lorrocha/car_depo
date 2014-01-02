class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path, notice: "#{@car.make} has been created!"
    else
      render :new
    end
  end

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  private
  def car_params
    params.require(:car).permit(:make,:year,:color,:mileage,:description)
  end
end
