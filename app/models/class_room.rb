class ClassRoom < ApplicationRecord
  validates :school, presence: true
  validates :school, presence: true
  validates :school, presence: true

  belongs_to :school
end
