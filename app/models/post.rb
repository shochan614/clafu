class Post < ApplicationRecord
  belongs_to :class_room

  with_options presence: true do
    validates :title
    validates :text
    validates :class_room_id
  end
end
