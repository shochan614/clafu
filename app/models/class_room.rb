class ClassRoom < ApplicationRecord
  with_options presence: true do
    validates :school_id 
    validates :grade
    validates :class_number
  end

  belongs_to :school
end
