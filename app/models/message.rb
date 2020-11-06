class Message < ApplicationRecord
  belongs_to :class_room
  belongs_to :user
end
