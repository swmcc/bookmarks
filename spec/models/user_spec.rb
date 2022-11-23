require 'rails_helper'

RSpec.describe User, type: :model do
  context 'as a default user' do
    let(:user) { build :user }

    it 'the user is a normal user' do
      expect(user.user_role?).to be_truthy
    end
  end

  context 'as an admin user' do
    let!(:user) { create :user, :admin }

    it 'the user is an admin' do
      expect(user.admin_role?).to be_truthy
    end
  end
end
