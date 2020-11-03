require 'rails_helper'

RSpec.describe School, type: :model do
  describe '学校登録' do
    before do
      @school = FactoryBot.build(:school)
    end
    it '学校名が入力されていれば、登録できること' do
      expect(@school).to be_valid
    end
    it '学校名が空白だと、登録できないこと' do
      @school.name = nil
      @school.valid?
      expect(@school.errors.full_messages).to include("Name can't be blank")
    end
  end
end
