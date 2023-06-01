require 'rails_helper'

RSpec.describe 'Users routing', type: :routing do
  describe 'GET /users' do
    it 'routes to #index' do
      expect(get: '/users').to route_to('users#index')
    end
  end

  describe 'GET /users/1' do
    it 'routes to #show' do
      expect(get: '/users/1').to route_to('users#show', id: '1')
    end
  end

  describe 'POST /users' do
    it 'routes to #create' do
      expect(post: '/users').to route_to('users#create')
    end
  end

  describe 'PUT /users/1' do
    it 'routes to #update via PUT' do
      expect(put: '/users/1').to route_to('users#update', id: '1')
    end
  end

  describe 'PATCH /users/1' do
    it 'routes to #update via PATCH' do
      expect(patch: '/users/1').to route_to('users#update', id: '1')
    end
  end

  describe 'DELETE /users/1' do
    it 'routes to #destroy' do
      expect(delete: '/users/1').to route_to('users#destroy', id: '1')
    end
  end
end
