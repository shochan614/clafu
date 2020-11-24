class ClassRoom < ApplicationRecord
  belongs_to :school
  has_many :users
  has_many :messages
  has_many :posts

  with_options presence: true do
    validates :grade, format: { with: /\A[0-9]+\z/, allow_blank: true}, inclusion: { in: 1..7, allow_blank: true }
    validates :class_number, format: { with: /\A[0-9]+\z/, allow_blank: true }, inclusion: { in: 1..10, allow_blank: true }
  end

end
