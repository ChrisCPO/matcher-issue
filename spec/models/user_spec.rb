require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:password) }

    it "email uniqueness is case-sensitive" do
      user = build(:user)
      user_2 = build(:user, email: user.email.upcase)

      user.save
      user_2.save

      expect(user_2.valid?).to eq false
      expect(user_2.errors).to include :email
    end
  end
end
