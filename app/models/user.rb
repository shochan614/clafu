class User < ApplicationRecord
  belongs_to :class_room
  has_many :messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  PASSWORD_REGEX = /\A(?=.*?[A-z])(?=.*?[\d])[A-z\d]+\z/i.freeze # 半角英数混合1字以上

  validates :password, length: { minimum: 6, allow_blank: true }, format: { with: PASSWORD_REGEX, allow_blank: true }
  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :attendance_number
  end

  def self.guest #ゲストユーザー用のアカウント作成
    find_or_create_by!(email: 'guest@example.com',
                       nickname: 'ゲスト',
                       class_room_id: 1, #実前に一つクラスを作っておく必要がある
                       first_name: 'ゲスト',
                       last_name: 'ゲスト',
                       attendance_number: 1) do |user|
      user.password = SecureRandom.urlsafe_base64 #パスワードはランダム生成
    end
  end

end
