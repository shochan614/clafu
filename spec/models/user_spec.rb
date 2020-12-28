require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it '全ての項目が入力されていれば、登録できること' do
      expect(@user).to be_valid
    end

    it 'クラスIDが空だと、登録することができないこと' do
      
    end
    it 'メールアドレスが空だと、登録することができないこと' do

    end
    it '上の名前が空だと、登録することができないこと' do

    end
    it '下の名前が空だと、登録することができないこと' do

    end
    it 'ニックネームが空だと、登録することができないこと' do

    end
    it '出席番号が空だと、登録することができないこと' do

    end
    it 'パスワードが空だと、登録することができないこと' do

    end
    it 'パスワード（かくにん）が空だと、登録することができないこと' do

    end

    it '存在しないクラスIDでは登録することができないこと' do

    end

    it '同じメールアドレスは登録することができないこと' do

    end
    it '' do

    end
  end
end