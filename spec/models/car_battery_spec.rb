require 'rails_helper'

RSpec.describe CarBattery, type: :model do
  it "is valid with valid attributes" do
    expect(build(:car_battery)).to be_valid
  end

  it "is invalid without a brand" do
    battery = build(:car_battery, brand: nil)
    expect(battery).to_not be_valid
  end

  it "is invalid without a model" do
    battery = build(:car_battery, model: nil)
    expect(battery).to_not be_valid
  end

  it "is invalid without a voltage" do
    battery = build(:car_battery, voltage: nil)
    expect(battery).to_not be_valid
  end

  it "is invalid without a price" do
    battery = build(:car_battery, price: nil)
    expect(battery).to_not be_valid
  end

  it "is invalid without a warranty" do
    battery = build(:car_battery, warranty: nil)
    expect(battery).to_not be_valid
  end

  it "must in integer greater than 0 for voltage" do
    battery = build(:car_battery, voltage: 0)
    expect(battery).to_not be_valid
  end

    it "must in integer greater than 0 for price" do
    battery = build(:car_battery, price: 0)
    expect(battery).to_not be_valid
  end

    it "must in integer greater than 0 for warranty" do
    battery = build(:car_battery, warranty: 0)
    expect(battery).to_not be_valid
  end
end
