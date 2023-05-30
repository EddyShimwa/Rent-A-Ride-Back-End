require 'test_helper'

class RentalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rental = rentals(:one)
  end

  test 'should get index' do
    get rentals_url, as: :json
    assert_response :success
  end

  test 'should create rental' do
    assert_difference('Rental.count') do
      post rentals_url,
           params: { rental: { car_id: @rental.car_id, city: @rental.city, end_date: @rental.end_date, price_per_day: @rental.price_per_day, start_date: @rental.start_date, user_id: @rental.user_id } }, as: :json
    end

    assert_response :created
  end

  test 'should show rental' do
    get rental_url(@rental), as: :json
    assert_response :success
  end

  test 'should update rental' do
    patch rental_url(@rental),
          params: { rental: { car_id: @rental.car_id, city: @rental.city, end_date: @rental.end_date, price_per_day: @rental.price_per_day, start_date: @rental.start_date, user_id: @rental.user_id } }, as: :json
    assert_response :success
  end

  test 'should destroy rental' do
    assert_difference('Rental.count', -1) do
      delete rental_url(@rental), as: :json
    end

    assert_response :no_content
  end
end
