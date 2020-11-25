class Post < ApplicationRecord
  belongs_to :class_room
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text, unless: :was_attached?
    validates :class_room_id
  end

  def was_attached?
    self.image.attached?
  end
end
