class CreateClassRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :class_rooms do |t|
      t.references :school, null: false, foreign_key: true
      t.integer :grade, null: false
      t.integer :class_number, null: false
      t.string :class_goals
      t.timestamps
    end
  end
end
