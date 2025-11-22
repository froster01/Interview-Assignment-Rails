class CarBatteriesController < ApplicationController
  before_action :auth_request
  before_action :set_car_battery, only: [ :show, :update, :destroy ]

  def index
    car_batteries = CarBattery.all
    render_success("Successfully fetch car batteries", { car_battery: car_batteries })
  end

  def show
    render_success("Car battery details received.", { car_battery: @car_battery  })
  end

  def create
    car_battery = CarBattery.new(car_battery_params)
    if car_battery.save
      render_success("Successfully create new car battery", { car_battery:  car_battery  }, :created)
    else
      render_error("Failed to create car battery", car_battery.errors.full_messages)
    end
  end

  def update
    if @car_battery.update(car_battery_params)
      render_success("Car battery updated successfully", { car_battery: @car_battery })
    else
      render_error("Car battery failed to update!.", @car_battery.errors.full_messages)
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
