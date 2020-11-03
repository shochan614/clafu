require 'rails_helper'

RSpec.describe ClassRoom, type: :model do
  describe '学級登録' do
    before do
      @school = FactoryBot.create(:school)
      @class_room = FactoryBot.build(:class_room)
    end
    it '必須項目が正しく入力されていれば、登録できること' do
      expect(@class_room).to be_valid
    end
  end
end
