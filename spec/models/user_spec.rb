require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it '全ての項目が入力されていれば、登録できること' do
      expect(@user).to be_valid
    end
  end
end