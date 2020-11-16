class User < ApplicationRecord
  belongs_to :class_room
  has_many :messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  PASSWORD_REGEX = /\A(?=.*?[A-z])(?=.*?[\d])[A-z\d]+\z/i.freeze # 半角英数混合1字以上

  validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }
  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :attendance_number
  end

end
