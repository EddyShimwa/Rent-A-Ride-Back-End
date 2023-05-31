require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Peter')
  end
  before { subject.save }

  it 'Should be valid ' do
    expect(subject).to be_valid
  end

  it 'Name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'car should have a name with length no less that 3' do
    subject.name = 'rl'
    expect(subject).to_not be_valid
  end
end
