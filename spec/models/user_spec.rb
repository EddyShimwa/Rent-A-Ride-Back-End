require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(email: 'example@example.com', password: 'password', name: 'Peter')
  end
  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email should be unique' do
    duplicate_user = User.new(email: 'example@example.com', password: 'password', name: 'John')
    expect(duplicate_user).to_not be_valid
    expect(duplicate_user.errors[:email]).to include('has already been taken')
  end

  it 'password should be encrypted' do
    expect(subject.password_digest).not_to eq('password')
  end

  it 'created_at and updated_at should be present' do
    expect(subject.created_at).to be_present
    expect(subject.updated_at).to be_present
  end

  it 'email should be case-insensitive' do
    lowercase_email = 'example@example.com'
    uppercase_email = 'EXAMPLE@example.com'
    expect(User.where('lower(email) = ?', lowercase_email.downcase).first).to eq(subject)
    expect(User.where('lower(email) = ?', uppercase_email.downcase).first).to eq(subject)
  end
end
