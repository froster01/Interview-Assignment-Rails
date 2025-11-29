require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attrbutes" do
    user = build(:user)
    expect(user).to be_valid
  end
  it 'invalid without username' do
    user = build(:user, username: nil)
    expect(user).not_to be_valid
  end

  it 'invalid without password' do
    user = build(:user, password: nil)
    expect(user).not_to be_valid
  end

  it 'invalid without password confirmation' do
    user = build(:user, password_confirmation: nil)
    expect(user).not_to be_valid
  end

  it 'hashed the password' do
    user = create(:user, password: "password123")
    expect(user.password_digest).not_to eq("password123")
  end

  it 'is authenticate with the correct password' do
    user= create(:user, password: "password123")
    expect(user.authenticate("password123")).to be_truthy
  end

  it 'is authenticate without the correct password' do
    user= create(:user, password: "password123")
    expect(user.authenticate("pass123")).to be_falsey
  end

  # it 'generate the auth_token when login' do
  #   user= create(:user)
  #   expect(user.auth_token).to be_present
  # end

  # it 'confirmed auth_token is unique' do
  #   user1 = create(:user, username: "Ali")
  #   user2 = create(:user, username: "Abu")

  #   expect(user1.auth_token).not_to eq(user2.auth_token)
  # end
end
