require 'rails_helper'

describe 'Reservations API' do
  path '/reservations' do
    get 'Fetches all reservations' do
      tags 'Reservations'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 data: {
                   type: :object,
                   properties: {
                     reservations: {
                       type: :array,
                       items: {
                         type: :object,
                         properties: {
                           id: { type: :integer },
                           start_date: { type: :string },
                           end_date: { type: :string },
                           car_id: { type: :integer },
                           user_id: { type: :integer }
                         },
                         required: %w[id start_date end_date car_id user_id]
                       }
                     }
                   }
                 }
               }

        run_test!
      end
    end

    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          start_date: { type: :string },
          end_date: { type: :string },
          car_id: { type: :integer },
          user_id: { type: :integer }
        },
        required: %w[start_date end_date car_id user_id]
      }

      response '201', 'reservation created' do
        let(:reservation) { { start_date: '2023-05-20', end_date: '2023-05-25', car_id: 1, user_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { { start_date: '2023-05-20', end_date: '2023-05-18', car_id: 1, user_id: 1 } }
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    delete 'Deletes a reservation' do
      tags 'Reservations'
      parameter name: :id, in: :path, type: :integer

      response '200', 'reservation deleted successfully' do
        let(:reservation) { create(:reservation) }
        let(:id) { reservation.id }

        run_test!
      end

      response '401', 'unauthorized' do
        let(:reservation) { create(:reservation) }
        let(:id) { reservation.id }

        before do
          allow_any_instance_of(ReservationsController).to receive(:current_user).and_return(create(:user))
        end

        run_test!
      end
    end
  end
end
