FactoryBot.define do
  factory :car_battery do
    brand { "AAMARON" }
    model { "Lorry" }
    voltage { 24 }
    price { 250 }
    warranty { 24 }
  end
end
