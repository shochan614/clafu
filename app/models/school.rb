class School < ApplicationRecord
  ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze # 全角ひらカタ漢字

  validates :name, presence: true, uniqueness: { case_sensitive: false }, format: { with: ZENKAKU_REGEX }
  has_many :class_rooms
end