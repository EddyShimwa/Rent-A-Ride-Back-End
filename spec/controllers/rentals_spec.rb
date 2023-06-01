require 'rails_helper'

RSpec.describe RentalsController, type: :controller do
  describe 'GET #index' do
    it 'returns a JSON response with all rentals' do
      # Create some rentals in the database
      myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
      car = Car.create(name: 'Car 1', model: 'Model 1', description: 'Description 1', rating: 4.5, price: 10000, rent_per_day: 50, user_id: myuser.id)

      rental1 = Rental.create(start_date: '2023-05-01', end_date: '2023-05-05', city: 'City 1', price_per_day: 100, car_id: car.id, user_id: myuser.id)
      rental2 = Rental.create(start_date: '2023-05-10', end_date: '2023-05-15', city: 'City 2', price_per_day: 150, car_id: car.id, user_id: myuser.id)

      get :index

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq([rental1.as_json, rental2.as_json])
    end
  end

  describe 'GET #show' do
    it 'returns a JSON response with the specified rental' do
      myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
      car = Car.create(name: 'Car 1', model: 'Model 1', description: 'Description 1', rating: 4.5, price: 10000, rent_per_day: 50, user_id: myuser.id)
      rental = Rental.create(start_date: '2023-05-01', end_date: '2023-05-05', city: 'City 1', price_per_day: 100, car_id: car.id, user_id: myuser.id)

      get :show, params: { id: rental.id }

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq(rental.as_json)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new rental and returns a JSON response with status code 201' do
        myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
        car = Car.create(name: 'Car 1', model: 'Model 1', description: 'Description 1', rating: 4.5, price: 10000, rent_per_day: 50, user_id: myuser.id)
        rental_params = { start_date: '2023-06-01', end_date: '2023-06-05', city: 'City 3', price_per_day: 120, car_id: car.id, user_id: myuser.id }

        post :create, params: { rental: rental_params }

        expect(response).to have_http_status(201)
        expect(JSON.parse(response.body)).to include('start_date' => '2023-06-01', 'end_date' => '2023-06-05')
      end
    end

    context 'with invalid parameters' do
      it 'returns a JSON response with the rental errors and status code 422' do
        rental_params = { start_date: '', end_date: '2023-06-05', city: 'City 4', price_per_day: 80, car_id: 4, user_id: 4 }

        post :create, params: { rental: rental_params }

        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)).to include('start_date' => ["can't be blank"])
      end
    end
  end

    describe 'PATCH #update' do
      context 'with valid parameters' do
        it 'updates the rental and returns a JSON response with status code 200' do
          myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
          car = Car.create(name: 'Car 1', model: 'Model 1', description: 'Description 1', rating: 4.5, price: 10000, rent_per_day: 50, user_id: myuser.id)
          rental = Rental.create(start_date: '2023-05-01', end_date: '2023-05-05', city: 'City 1', price_per_day: 100, car_id: car.id, user_id: myuser.id)
          rental_params = { city: 'Updated City' }
  
          patch :update, params: { id: rental.id, rental: rental_params }
  
          expect(response).to have_http_status(200)
          expect(JSON.parse(response.body)).to include('city' => 'Updated City')
        end
      end
  
      context 'with invalid parameters' do
        it 'returns a JSON response with the rental errors and status code 422' do
          myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
          car = Car.create(name: 'Car 1', model: 'Model 1', description: 'Description 1', rating: 4.5, price: 10000, rent_per_day: 50, user_id: myuser.id)
          rental = Rental.create(start_date: '2023-05-01', end_date: '2023-05-05', city: 'City 1', price_per_day: 100, car_id: car.id, user_id: myuser.id)
          rental_params = { start_date: '', end_date: '2023-05-10' }
  
          patch :update, params: { id: rental.id, rental: rental_params }
  
          expect(response).to have_http_status(422)
          expect(JSON.parse(response.body)).to include('start_date' => ["can't be blank"])
        end
      end
  end
  

  describe 'DELETE #destroy' do
    it 'deletes the rental and returns a JSON response with status code 200' do
      myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
      car = Car.create(name: 'Car 1', model: 'Model 1', description: 'Description 1', rating: 4.5, price: 10000, rent_per_day: 50, user_id: myuser.id)
      rental = Rental.create(start_date: '2023-05-01', end_date: '2023-05-05', city: 'City 1', price_per_day: 100, car_id: car.id, user_id: myuser.id)

      delete :destroy, params: { id: rental.id }

      expect(response).to have_http_status(200)
    end
  end
end
