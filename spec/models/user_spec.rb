require 'rails_helper'

# TODO: Test alternate syntax
# RSpec.describe User, type: model do
RSpec.describe User, type: :model do
  let(:user) { User.create!(name: 'Test User', email: 'test@user.com', password: 'loljkthxbai') }

  it { should validate_presence_of(:name) }
  # TODO: Limit on name length?

  it { should validate_presence_of(:email) }
  it { should validate_uniquness_of(:email) }
  # TODO: Limit on email length?
  it { should allow_value('test@user.com').for(:email) }
  it { should_not allow_value('testuser.com').for(:email) }

  it { should validate_presence_of(:password) }
  it { should have_secure_password }
  # TODO: Limit on password length?

  describe 'attributes' do
    it 'should respond to name' do
      expect(user).to respond_to(:name)
    end

    it 'should respond to email' do
      expect(user).to respond_to(:email)
    end
  end
end
