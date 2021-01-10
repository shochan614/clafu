require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'メッセージ投稿' do
    before do
      @message = FactoryBot.build(:message)
    end
  it 'テキストがあれば、メッセージを送信することができる' do
    
  end
  end
end
