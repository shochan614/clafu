class School < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :class_rooms
end