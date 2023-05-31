require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Peter')
  end
  before { subject.save }

  it 'Should be valid ' do
    expect(subject).to be_valid
  end


end
