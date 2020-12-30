require 'rails_helper'

RSpec.describe ClassRoom, type: :model do
  describe '学級登録' do
    before do
      @class_room = FactoryBot.build(:class_room)
    end
    it '全ての項目が入力されていれば、登録できること' do
    end
    it '必須項目が正しく入力されていれば、登録できること' do
    end
    it '学校名を入力していないと、登録できないこと' do

    end
    it '学年を入力していないと、登録できないこと' do
    end
    it '学年が8以上では登録できないこと' do
    end
    it '組を入力していないと、登録できないこと' do
    end
    it '組が11以上では登録できないこと' do
    end
  end
end
