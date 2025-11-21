class CarBatteriesController< ApplicationController
  before_action :set_car_battery, only: [ :show, :update, :destroy ]

  def index
    @car_batteries = CarBattery.all
    render json: @car_batteries, status: :ok
  end


  def show
    if @car_battery = CarBattery.find(params[:id])
    render json: @car_battery, status: :ok
    else
      render json: @car_battery.errors, status: :unprocessable_entity
    end
  end


  def create
    @car_battery= CarBattery.new(car_battery_params)
    if @car_battery.save
      render json: @car_battery, status: :created
    else
        render json: @car_battery.errors, status: :unprocessable_entity
    end
  end

  def update
    if @car_battery.update(car_battery_params)
      render json: @car_battery, status: :ok
    else
      render json: @car_battery.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @car_battery.destroy
    render json: @car_battery, status: :no_content
    else
      render json: @car_battery.errors, status: :unprocessable_entity
    end
  end
end

private

def car_battery_params
params.require(:car_battery).permit(:brand, :model, :voltage, :price, :warranty)
end

def set_car_battery
  @car_battery= CarBattery.find(params[:id])
end
