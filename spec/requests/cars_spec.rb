require 'rails_helper'

describe 'Cars', type: :request do
  subject do
    myuser = User.create(email: 'example@example.com', password: 'password')
    Car.create(name: 'Chevrolet Silverado', model: '1500 Custom', description: 'Popular full-size pickup truck manufactured by General Motors under the Chevrolet brand.', rating: 2, price: 70.6, rent_per_day: 98.99, user_id: myuser.id)
  end

  let(:login_response) do
    post '/login', params: { username: 'Peter' }
    JSON.parse(response.body)
  end

  # GET api/v1/cars
  describe 'GET / with valid JWT token' do
    it 'should return ok status code' do
      headers = {
        Authorization: 'Bearer abc123',
        'Content-Type': 'application/json'
      }

      get '/cars', headers: headers
      expect(response).to have_http_status(:ok)
    end
  end

  # POST api/v1/cars
  describe 'POST /create with empty or invalid JWT token' do
    it 'should return unprocessable entity status code' do
      params = {
        car: {
          name: 'MERCEDES BENZ G CLASS',
          description: 'MERCEDES G63 AMG - SERIES 21: S21-02',
          rating: 2,
          model: 'j66',
          price: 210,
          rent_per_day: 210.6
        }
      }

      headers = {
        Authorization: 'Bearer abc123',
        'Content-Type': 'application/json'
      }

      post '/cars', params: params.to_json, headers: headers
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'POST /create with valid JWT token' do
    it 'should return unauthorized status code' do
      params = {
        car: {
          name: 'MERCEDES BENZ G CLASS',
          description: 'MERCEDES G63 AMG - SERIES 21: S21-02',
          rating: 2,
          model: 'j66',
          price: '210',
          rent_per_day: '210.6',
          images: [
            'https://example.com.jpg',
            'https://example.com.jpg',
            'https://example.com.jpg'
          ]
        }
      }

      headers = {
        Authorization: 'Bearer abc123',
        'Content-Type': 'application/json'
      }

      post '/cars', params: params.to_json, headers: headers
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
