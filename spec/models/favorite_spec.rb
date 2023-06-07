require 'rails_helper'

RSpec.describe Rental, type: :model do
  subject do
    myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
    mycar = Car.create(name: 'toyota', model: 'v8', description: 'the best car in the city', car_image_url: "example@example.com", rating: 5, price: 200.7,
                       rent_per_day: 2, user_id: myuser.id)
    Favorite.create(name: "Benz Mercedes", description: "Experience the epitome of luxury and performance with the Benz Mercedes GLK350. This exceptional SUV combines elegant design, advanced technology, and unparalleled comfort. Don't miss the opportunity to drive this remarkable vehicle.", image: "https://img2.carmax.com/img/vehicles/23940877/4.jpg?width=400&ratio=16/9", car_id: mycar.id, user_id: myuser.id)
  end
  before { subject.save }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without an image' do
      subject.image = nil
      expect(subject).to_not be_valid
    end

    it 'is should always have an image url' do
      subject.image = 'www.image.com.png'
      expect(subject).to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      expect(subject.user).to be_instance_of(User)
    end

    it 'should have city name' do
      expect(subject.car).to be_instance_of(Car)
    end
  end
end