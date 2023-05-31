require 'rails_helper'

RSpec.describe Rental, type: :model do
  subject do
    myuser = User.create(email: 'example@example.com', password: 'password', name: 'Peter')
    Car.create(name: 'Chevrolet Silverado', model: '1500 Custom', description: 'Popular full-size pickup truck manufactured by General Motors under the Chevrolet brand.', rating: 2, price: 70.6, rent_per_day: 98.99, user_id: myuser.id)
  end
  before { subject.save }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a number of rents one day' do
      subject.rent_per_day = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'it should always have a model ' do
      subject.model = 'H432'
      expect(subject).to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      expect(subject.user).to be_instance_of(User)
    end
  end
end
