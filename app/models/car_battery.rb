class CarBattery < ApplicationRecord
  validates :brand, :model, :voltage, :price, :warranty, presence: true
  validates :voltage, :price, :warranty, numericality: { only_integer: true, greater_than: 0 }
end
