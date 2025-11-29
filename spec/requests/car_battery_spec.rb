require 'rails_helper'
RSpec.describe "Users", type: :request do
  describe 'Index Car Batteries API' do
    describe 'GET /car_batteries' do
      let(:user) { create(:user) }
      it "Fetch all car_batteries data." do
        token = jwt_for(user)
        get '/car_batteries', headers: {
          'Authorization': "Bearer #{token}"
        }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'Battery Detail API' do
    describe 'GET /car_batteries/:id' do
      let(:user) { create(:user) }
      let(:car_battery) { create(:car_battery) }
      it "show battery detail" do
        token = jwt_for(user)
        get "/car_batteries/#{car_battery.id}", headers: {
          'Authorization': "Bearer #{token}"
        }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'Create Battery API' do
    describe 'POST /car_batteries' do
      let(:user) { create(:user) }
      let(:car_battery_params) { attributes_for(:car_battery) }
      it 'Save new battery data' do
        token = jwt_for(user)
        post "/car_batteries",
        params: {
          car_battery: car_battery_params
        },
        headers: {
          'Authorization': "Bearer #{token}"
        }
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe 'Edit Battery Detail API' do
      describe 'PUT /car_batteries' do
        let(:user) { create(:user) }
        let(:car_battery) { create(:car_battery) }
        let(:car_battery_params) { attributes_for(:car_battery) }
        it 'Edit the battery details' do
          token = jwt_for(user)
          put "/car_batteries/#{car_battery.id}",
          params: {
            car_battery: car_battery_params
          },
          headers: {
            'Authorization': "Bearer #{token}"
          }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'Delete Battery API' do
    describe 'DELETE /car_batteries/:id' do
      let (:user) { create(:user) }
      let (:car_battery) { create(:car_battery) }
      it 'Delete the battery data' do
        token = jwt_for(user)
        delete "/car_batteries/#{car_battery.id}",
        headers: {
          "Authorization": "Bearer #{token}"
        }
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
