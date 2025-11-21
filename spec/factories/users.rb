FactoryBot.define do
  factory :user do
    username { "testuser123" }
    password { "password123" }
    password_confirmation { "password123" }
    auth_token { SecureRandom.hex(20) }
  end
end
