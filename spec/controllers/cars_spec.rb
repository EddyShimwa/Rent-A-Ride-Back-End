require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  describe 'GET #index' do
    it 'returns a JSON response with all cars' do
      # Create some cars in the database
      myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
      car1 = Car.create(name: 'Car 1', model: 'Model 1', description: 'Description 1', car_image_url: 'www.example.png', rating: 4.5, price: 10_000, rent_per_day: 50, user_id: myuser.id)
      car2 = Car.create(name: 'Car 2', model: 'Model 2', description: 'Description 2', car_image_url: 'www.example.png', rating: 4.0, price: 15_000, rent_per_day: 75, user_id: myuser.id)

      get :index

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq([car1.as_json, car2.as_json])
    end
  end

  describe 'GET #show' do
    it 'returns a JSON response with the specified car' do
      # Create a car in the database
      myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
      car = Car.create(name: 'Car 1', model: 'Model 1', description: 'Description 1', car_image_url: 'www.example.png', rating: 4.5, price: 10_000, rent_per_day: 50, user_id: myuser.id)

      get :show, params: { id: car.id }

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq(car.as_json)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new car and returns a JSON response with status code 201' do
        myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
        car_params = { name: 'Car 3', model: 'Model 3', description: 'Description 3', car_image_url: 'www.example.png', rating: 4.2, price: 12_000, rent_per_day: 60, user_id: myuser.id }

        post :create, params: { car: car_params }

        expect(response).to have_http_status(201)
        expect(JSON.parse(response.body)).to include('name' => 'Car 3', 'model' => 'Model 3')
      end
    end

    context 'with invalid parameters' do
      it 'returns a JSON response with the car errors and status code 422' do
        myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
        car_params = { name: '', model: 'Model 4', description: 'Description 4', car_image_url: 'www.example.png', rating: 3.5, price: 8000, rent_per_day: 40, user_id: myuser.id }

        post :create, params: { car: car_params }

        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)).to include('name' => ["can't be blank"])
      end
    end
  end

  context 'with invalid parameters' do
    it 'returns a JSON response with the car errors and status code 422' do
      myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
      car = Car.create(name: 'Car 1', model: 'Model 1', description: 'Description 1', car_image_url: 'www.example.png', rating: 4.5, price: 10_000, rent_per_day: 50, user_id: myuser.id)
      car_params = { name: '', model: 'Updated Model' }

      patch :update, params: { id: car.id, car: car_params }

      expect(response).to have_http_status(422)
      expect(JSON.parse(response.body)).to include('name' => ["can't be blank"])
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the car and returns a JSON response with status code 200' do
      myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
      car = Car.create(name: 'Car 1', model: 'Model 1', description: 'Description 1', car_image_url: 'www.example.png', rating: 4.5, price: 10_000, rent_per_day: 50, user_id: myuser.id)

      delete :destroy, params: { id: car.id }

      expect(response).to have_http_status(200)
      expect(response.body).to eq('Car deleted successfully')
    end
  end
end
