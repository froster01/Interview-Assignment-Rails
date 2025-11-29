FactoryBot.define do
  factory :user do
    username { "testuser123" }
    password { "password123" }
    password_confirmation { "password123" }
  end
end
