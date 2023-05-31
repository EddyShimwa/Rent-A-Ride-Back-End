require 'rails_helper'

admin = User.create(
  email: 'example@example.com',
  password: 'password',
  name: 'John Doe'
)
describe 'Cars', type: :request do

  let!(:car) { create(:car, user: admin) }

  let(:login_response) do
    post '/login', params: { username: 'Peter' }
    JSON.parse(response.body)
  end

  
end
