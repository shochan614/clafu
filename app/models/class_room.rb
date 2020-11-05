class ClassRoom < ApplicationRecord
  with_options presence: true do
    validates :school_id 
    validates :grade, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 1..7 }
    validates :class_number, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 1..10 }
  end

  belongs_to :school
  has_many :users
end
