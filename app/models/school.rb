class School < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :class_rooms
end