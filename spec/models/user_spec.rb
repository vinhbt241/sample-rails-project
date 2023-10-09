# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { User.new(name: 'Mr.A', email: 'mraemail@gmail.com', birthdate: 19.years.ago) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:birthdate) }

    context 'when user is underage' do
      let(:user) { User.new(name: 'Mr.A', email: 'mraemail@gmail.com', birthdate: 17.years.ago) }

      it 'he/she can not create account' do
        expect(user.valid?).to be false
        expect(user.errors.full_messages).to include('Birthdate indicate user is under 18')
      end
    end
  end
end
