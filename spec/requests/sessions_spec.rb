require 'rails_helper'

describe 'Registration API', type: :request do
  describe 'POST /register' do
    it 'creates new user with generated auth_token' do
      post '/register', params: {
        user: {
          username: 'testuser123',
          password: 'password123',
          password_confirmation: 'password123'
        }
      }
      expect(response).to have_http_status(:created)
    end
  end
end

describe 'Login API', type: :request do
  describe 'POST /login' do
    let(:user) { create(:user) }
    let(:user_params) { attributes_for(:user) }
    it 'Login the user with bearer authorization token' do
      post '/login', params: {
        user: user_params
      },
      headers: {
        "Authorization": "Bearer #{user.auth_token}"
      }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['token']).to be_present
    end
  end
end

describe 'Logout API', type: :request do
  describe 'DELETE /logout' do
    let(:user) { create(:user) }
    it 'Logout the user and delete session auth_token' do
      delete '/logout', headers: {
          Authorization: "Bearer #{user.auth_token}"
      }

      expect(response).to have_http_status(:ok)
      user.reload
      expect(user.auth_token).to be_present
    end
  end
end
