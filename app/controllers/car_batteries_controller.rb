class CarBatteriesController < ApplicationController
  before_action :auth_request
  before_action :set_car_battery, only: [ :show, :update, :destroy ]

  def index
    car_batteries = CarBattery.all
    render json: {
      message: "Successfully fetch car batteries.",
      data: car_batteries
    }, status: :ok
  end

  def show
    render json: {
      message: "Car battery details received.",
      data: @car_battery
    }, status: :ok
  end

  def create
    car_battery = CarBattery.new(car_battery_params)
    if car_battery.save
      render json: {
        message: "Succesfully create new car battery.",
        data: car_battery
      }, status: :created
    else
      render json: {
        message: "Failed to create car battery.",
        errors: car_battery.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def update
    if @car_battery.update(car_battery_params)
      render json: {
        message: "Car battery updated successfully.",
        data: @car_battery
      }, status: :ok
    else
      render json: {
        message: "Car battery update failed.",
        errors: @car_battery.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @car_battery.destroy
    head :no_content
  end

  private

  def car_battery_params
    params.require(:car_battery).permit(:brand, :model, :voltage, :price, :warranty)
  end

  def set_car_battery
    @car_battery = CarBattery.find(params[:id])
  end
end
