require 'rails_helper'

RSpec.describe Reservation, type: :model do
  subject do
    myuser = User.create(name: 'Eddy')
    mycar = Car.create(name: 'toyota', model: 'v8', description: 'the best car in the city', rating: 5 price: 200.7,
                       rent_per_day: 2, user_id: myuser.id)
    Rental.create(
      start_date: Date.today,
      end_date: Date.tomorrow,
      price_per_day: 50.00,
      city: 'New York',
      car_id: mycar.id,
      user_id: myuser.id
    )
  end
  before { subject.save }

  
end
