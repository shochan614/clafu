require 'rails_helper'

RSpec.describe ClassRoom, type: :model do
  describe '学級登録' do
    before do
      @class_room = FactoryBot.build(:class_room)
    end
    it '全ての項目が入力されていれば、登録できること' do
      expect(@class_room).to be_valid
    end
    it '必須項目が正しく入力されていれば、登録できること' do
      @class_room.class_goals = nil
      expect(@class_room).to be_valid
    end

    it '学校名を入力していないと、登録できないこと' do
      @class_room.school = nil
      @class_room.valid?
      expect(@class_room.errors.full_messages).to include("学校名を入力してください")
    end
    it '学年を入力していないと、登録できないこと' do
      @class_room.grade = nil
      @class_room.valid?
      expect(@class_room.errors.full_messages).to include("学年を入力してください")
    end
    it '組を入力していないと、登録できないこと' do
      @class_room.class_number = nil
      @class_room.valid?
      expect(@class_room.errors.full_messages).to include("組を入力してください")
    end

    it '学年が8以上では登録できないこと' do
      @class_room.grade = 8
      @class_room.valid?
      expect(@class_room.errors.full_messages).to include("学年は一覧にありません")
    end
    it '組が11以上では登録できないこと' do
      @class_room.class_number = 11
      @class_room.valid?
      expect(@class_room.errors.full_messages).to include("組は一覧にありません")
    end
  end
end
