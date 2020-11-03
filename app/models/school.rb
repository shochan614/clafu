class School < ApplicationRecord
  validates :name, presence: true
  has_many :class_rooms
end