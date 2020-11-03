require 'rails_helper'

RSpec.describe School, type: :model do
  describe '学校登録' do
    before do
      @school = FactoryBot.build(:school)
    end
  end
end
