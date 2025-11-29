require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'Login API' do
    describe 'POST /sessions/login' do
      let(:user) { create(:user, password: "password123") }
      it 'Login the user with bearer authorization token' do
        post '/sessions/login', params: {
          username: user.username,
          password: "password123"
        }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['data']).to be_present
      end
    end
  end

  describe 'Logout API' do
    describe 'DELETE /sessions/logout' do
      let(:user) { create(:user) }
      it 'Logout the user and delete session auth_token' do
        token = jwt_for(user)
        delete '/sessions/logout', headers: {
            Authorization: "Bearer #{token}"
        }

        expect(response).to have_http_status(:ok)
        user.reload
        expect(token).to be_present
      end
    end
  end
end
