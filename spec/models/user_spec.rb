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
      @user.class_room = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("クラスIDを入力してください")
    end
    it 'メールアドレスが空だと、登録することができないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end
    it '上の名前が空だと、登録することができないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("上の名前を入力してください")
    end
    it '下の名前が空だと、登録することができないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("下の名前を入力してください")
    end
    it 'ニックネームが空だと、登録することができないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it '出席番号が空だと、登録することができないこと' do
      @user.attendance_number = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("出席番号を入力してください")
    end
    it 'パスワードが空だと、登録することができないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email.delete!('@')
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '12345'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it 'パスワードは、半角英字がないとでの入力が必須であること' do
      @user.password = '123456'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
    it 'パスワードは、半角数字がないとでの入力が必須であること' do
      @user.password = 'abcdef'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
    it 'パスワードは全角数字では登録できないこと' do
      @user.password = '１２３４５a'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it 'パスワードとパスワード（かくにん）、値の一致が必須であること' do
      @user.password = '12345a'
      @user.password_confirmation = '12345b'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（かくにん）とパスワードの入力が一致しません")
    end
  end
end