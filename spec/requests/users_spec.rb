require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "index user API" do
    let(:user) { create (:user)  }
    it "returns http success" do
      token = jwt_for(user)
      get "/users", headers: {
        'Authorization': "bearer #{token}"
      }

      expect(response).to have_http_status(:success)
    end
  end

  describe "create user API" do
    it "returns http success" do
      post "/users", params: {
        user: {
        username: "testuser123",
        password: "test123",
        password_confirmation: "test123"
      }
    }
      expect(response).to have_http_status(:created)
    end
  end

  describe "show user API" do
    let(:user) { create(:user) }
    it "returns http success" do
      token = jwt_for(user)
      get "/users/#{user.id}", headers: {
        'Authorization': "Bearer #{token}"
      }
      expect(response).to have_http_status(:success)
    end
  end

  describe "update user API" do
    let(:user) { create (:user) }
    let(:user_params) { attributes_for(:user) }
    it "returns http success" do
      token = jwt_for(user)
      put "/users/#{user.id}", params: {
        user: user_params
        },
        headers: {
        "Authorization": "Bearer #{token}"
      }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    let(:user) { create (:user) }
    it "returns http success" do
      token = jwt_for(user)
      delete "/users/#{user.id}", headers: {
        "Authorization": "Bearer #{token}"
      }
      expect(response).to have_http_status(:success)
    end
  end
end
