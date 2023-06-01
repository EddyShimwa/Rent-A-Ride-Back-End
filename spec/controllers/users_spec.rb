require 'rails_helper'

describe 'Users API' do
  path '/users' do
    get 'Fetches all users' do
      tags 'Users'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   email: { type: :string },
                   role: { type: :string }
                 },
                 required: %w[id name email role]
               }

        run_test!
      end
    end

    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          role: { type: :string }
        },
        required: %w[name email password role]
      }

      response '201', 'user created' do
        let(:user) { { name: 'John Doe', email: 'john.doe@example.com', password: 'password123', role: 'user' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'John Doe', email: 'john.doe@example.com', password: 'password123' } }
        run_test!
      end
    end
  end

  path '/users/{id}' do
    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 email: { type: :string },
                 role: { type: :string }
               },
               required: %w[id name email role]

        let(:user) { create(:user) }
        let(:id) { user.id }

        run_test!
      end
    end

    delete 'Deletes a user' do
      tags 'Users'
      parameter name: :id, in: :path, type: :integer

      response '200', 'user deleted successfully' do
        let(:user) { create(:user) }
        let(:id) { user.id }

        run_test!
      end
    end
  end
end
