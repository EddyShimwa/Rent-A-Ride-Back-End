require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a JSON response with all users' do
      # Create some users in the database
      user1 = User.create(name: 'John', email: 'john@example.com', password: 'password1')
      user2 = User.create(name: 'Jane', email: 'jane@example.com', password: 'password2')

      get :index

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq([user1.as_json, user2.as_json])
    end
  end

  describe 'GET #show' do
    it 'returns a JSON response with the specified user' do
      user = User.create(name: 'John', email: 'john@example.com', password: 'password')

      get :show, params: { id: user.id }

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq(user.as_json)
    end
  end

  describe 'POST #create' do
    context 'with invalid parameters' do
      it 'returns a JSON response with an error message and status code 406' do
        user_params = { name: 'John', email: '', password: 'password' }

        post :create, params: { user: user_params }

        expect(response).to have_http_status(406)
        expect(JSON.parse(response.body)).to include('error' => 'failed to create user')
      end
    end
  end

  describe 'POST #login' do
    context 'with valid credentials' do
      it 'authenticates the user and returns a JSON response with status code 202' do
        user = User.create(name: 'John', email: 'john@example.com', password: 'password')

        post :login, params: { email: user.email, password: 'password' }

        expect(response).to have_http_status(202)
        expect(JSON.parse(response.body)).to include('user' => user.as_json)
        expect(JSON.parse(response.body)).to have_key('jwt')
      end
    end

    context 'with invalid credentials' do
      it 'returns a JSON response with an error message and status code 401' do
        user = User.create(name: 'John', email: 'john@example.com', password: 'password')

        post :login, params: { email: user.email, password: 'wrong_password' }

        expect(response).to have_http_status(401)
        expect(JSON.parse(response.body)).to include('error' => 'Invalid email or password')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the user and returns a JSON response with status code 200' do
      user = User.create(name: 'John', email: 'john@example.com', password: 'password')

      delete :destroy, params: { id: user.id }

      expect(response).to have_http_status(200)
      expect(response.body).to eq('User deleted successfully')
    end
  end
end
