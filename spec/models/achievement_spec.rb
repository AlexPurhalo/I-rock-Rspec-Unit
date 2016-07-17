require 'rails_helper'

RSpec.describe Achievement, type: :model do
  describe 'validates' do
    it 'requires title' do
      achievement = Achievement.new()
      expect(achievement.valid?).to be_falsy
    end

    it 'require title to unique for one user' do
      user = FactoryGirl.create(:user)
      first_achievement = FactoryGirl.create(:public_achievement, title: 'First Achievement', user: user)
      new_achievement = Achievement.new(title: 'First Achievement', user: user)
      expect(new_achievement.valid?).to be_falsy
    end

    it 'allows different users to have achievements with identical titles' do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      first_achievement = FactoryGirl.create(:public_achievement, title: 'First Achievement', user: user1)
      new_achievement = Achievement.new(title: 'First Achievement', user: user2)
      expect(new_achievement.valid?).to be_truthy
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      achievement = Achievement.new(title: 'Some title', user: nil)
      expect(achievement.valid?).to be_falsy
    end

    it 'has belongs_to user association' do
      # 1 approach
      user = FactoryGirl.create(:user)
      achievement = FactoryGirl.create(:public_achievement, user: user)
      expect(achievement.user).to eq(user)

      # 2 approach
      u = Achievement.reflect_on_association(:user)
      expect(u.macro).to eq(:belongs_to)
    end
  end
end
