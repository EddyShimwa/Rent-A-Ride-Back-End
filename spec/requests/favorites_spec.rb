require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/favorites/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/favorites/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/favorites/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/favorites/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
