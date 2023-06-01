require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a JSON response with all rentals' do
      # Create some rentals in the database
      myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
      get :index

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq([myuser.as_json])
    end
  end

  describe 'GET #show' do
    it 'returns a JSON response with the specified user' do
      user = User.create(name: 'John', email: 'john@example.com', password: 'password')

      get :show, params: { id: user.id }

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to include(
        'id' => user.id,
        'name' => 'John',
        'email' => 'john@example.com'
      )
    end
    it 'returns a JSON response with the specified user' do
      user = User.create(name: 'John', email: 'john@example.com', password: 'password')

      get :show, params: { id: user.id }

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to include(
        'id' => user.id,
        'name' => 'John',
        'email' => 'john@example.com'
      )
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new user and returns a JSON response with status code 201' do
        user_params = { name: 'John', email: 'john@example.com', password: 'password' }

        post :create, params: { user: user_params }

        expect(response).to have_http_status(201)
        expect(JSON.parse(response.body)).to include(
          'user' => include(
            'name' => 'John',
            'email' => 'john@example.com'
          ),
          'jwt' => be_present
        )
      end
    end

    context 'with invalid parameters' do
      it 'returns a JSON response with the error message and status code 406' do
        user_params = { name: 'John', email: '', password: 'password' }

        post :create, params: { user: user_params }

        expect(response).to have_http_status(406)
        expect(JSON.parse(response.body)).to include('error' => 'failed to create user')
      end
    end
  end

  describe 'POST #login' do
    context 'with valid credentials' do
      it 'returns a JSON response with the user and JWT token' do
        user = User.create(name: 'John', email: 'john@example.com', password: 'password')

        post :login, params: { email: 'john@example.com', password: 'password' }

        expect(response).to have_http_status(202)
        expect(JSON.parse(response.body)).to include(
          'user' => include(
            'id' => user.id,
            'name' => 'John',
            'email' => 'john@example.com'
          ),
          'jwt' => be_present
        )
      end
    end

    context 'with invalid credentials' do
      it 'returns a JSON response with the error message and status code 401' do
        User.create(name: 'John', email: 'john@example.com', password: 'password')

        post :login, params: { email: 'john@example.com', password: 'wrong_password' }

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
      expect(response.body).to eq 'User deleted successfully'
      expect(User.find_by(id: user.id)).to be_nil
    end
  end
end
