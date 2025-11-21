require 'rails_helper'

describe 'Index Car Batteries API', type: :request do
  describe 'GET /car_batteries' do
    let(:user) { create(:user) }
    it "Fetch all car_batteries data." do
      get '/car_batteries', headers: {
        'Authorization': "Bearer #{user.auth_token}"
      }
      expect(response).to have_http_status(:ok)
    end
  end
end

describe 'Battery Detail API', type: :request do
  describe 'GET /car_batteries/:id' do
    let(:user) { create(:user) }
    let(:car_battery) { create(:car_battery) }
    it "show battery detail" do
      get "/car_batteries/#{car_battery.id}", headers: {
        'Authorization': "Bearer #{user.auth_token}"
      }
      expect(response).to have_http_status(:ok)
    end
  end
end

describe 'Create Battery API', type: :request do
  describe 'POST /car_batteries' do
    let(:user) { create(:user) }
    let(:car_battery_params) { attributes_for(:car_battery) }
    it 'Save new battery data' do
      post "/car_batteries",
      params: {
        car_battery: car_battery_params
      },
      headers: {
        'Authorization': "Bearer #{user.auth_token}"
      }
      expect(response).to have_http_status(:created)
    end
  end
end

describe 'Edit Battery Detail API', type: :request do
    describe 'PUT /car_batteries' do
      let(:user) { create(:user) }
      let(:car_battery) { create(:car_battery) }
      let(:car_battery_params) { attributes_for(:car_battery) }
      it 'Edit the battery details' do
        put "/car_batteries/#{car_battery.id}",
        params: {
          car_battery: car_battery_params
        },
        headers: {
          'Authorization': "Bearer #{user.auth_token}"
        }
      expect(response).to have_http_status(:ok)
    end
  end
end

describe 'Delete Battery API', type: :request do
  describe 'DELETE /car_batteries/:id' do
    let (:user) { create(:user) }
    let (:car_battery) { create(:car_battery) }
    it 'Delete the battery data' do
      delete "/car_batteries/#{car_battery.id}",
      headers: {
        "Authorization": "Bearer #{user.auth_token}"
      }
      expect(response).to have_http_status(:no_content)
    end
  end
end
