require 'rails_helper'

RSpec.describe Car, type: :model do
  subject do
    myuser = User.create(name: 'Eddy')
    mycar = Car.create(name: 'toyota', model: 'v8', description: 'the best car in the city', price: 200.7,
                       rent_per_day: 2, user_id: myuser.id)
    Image.create(
      url: 'https://www.mbusa.com/content/dam/mb-nafta/us/myco/my23/g/class-page/series/2023-G-SUV-HERO-DR.jpg', car: mycar
    )
  end
  before { subject.save }

  it 'Should be valid ' do
    expect(subject).to be_valid
  end

  it 'Name should not be nil' do
    subject.url = nil
    expect(subject).to_not be_valid
  end

  it 'image should have an associated car' do
    subject.car = nil
    expect(subject).to_not be_valid
  end

  it 'Name should not be nil' do
    subject.url = nil
    expect(subject).to_not be_valid
  end

  describe 'attributes' do
    it 'should have a car association' do
      car = Car.create(name: 'Toyota')
      image = Image.new(url: 'https://example.com/image.jpg', car:)
      expect(image.car).to eq(car)
    end

    it 'should have a working URL' do
      image = Image.new(url: 'https://example.com/image.jpg')
      expect(image.url).to eq('https://example.com/image.jpg')
    end

    it 'should have associations' do
      mycar = Car.create(name: 'Toyota')
      image = Image.new(url: 'https://example.com/image.jpg', car: mycar)
      expect(image.car).to eq(mycar)
    end

    it 'should have a URL' do
      image = Image.new(url: 'https://example.com/image.jpg')
      expect(image.url).to eq('https://example.com/image.jpg')
    end
  end
end
