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
      expect(@school.errors.full_messages).to include("学校名を入力してください")
    end
    it '同じ学校名は登録できないこと' do
      @school.name = '横浜小学校'
      another_school = FactoryBot.build(:school)
      another_school.name = '横浜小学校'
      # binding.pry
      another_school.valid?
      expect(another_school.errors.full_messages).to include("学校名はすでに存在します")
    end
  end
end
