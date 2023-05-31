require 'rails_helper'

describe 'Cars API' do
  path '/api/v1/cars' do
    get 'Fetches all cars' do
      tags 'Cars'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   model: { type: :string },
                   description: { type: :string },
                   rent_per_day: { type: :number },
                   user_id: { type: :integer }
                 },
                 required: %w[id name description rent_per_day user_id]
               }

        run_test!
      end
    end

    post 'Creates a car' do
      tags 'Cars'
      consumes 'application/json'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          rent_per_day: { type: :number },
          user_id: { type: :integer }
        },
        required: %w[name user_id]
      }

      response '201', 'car created' do
        let(:car) do
          { name: 'Car Name', description: 'Car Description', model: 'car model', price: 200, rent_per_day: 100,
            user_id: 1 }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:car) { { name: 'Car Name', user_id: 1 } }
        run_test!
      end
    end
  end

  path '/api/v1/cars/{id}' do
    get 'Retrieves a car' do
      tags 'Cars'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :string },
                 rent_per_day: { type: :number },
                 user_id: { type: :integer }
               },
               required: %w[id name description rent_per_day user_id]

        let(:car) { create(:car) }
        let(:id) { car.id }

        run_test!
      end
    end

    delete 'Deletes a car' do
      tags 'Cars'
      parameter name: :id, in: :path, type: :integer

      response '200', 'car deleted successfully' do
        let(:car) { create(:car) }
        let(:id) { car.id }

        run_test!
      end
    end
  end
end
