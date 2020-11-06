class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.t.references :class_room, foreign_key: true
      t.t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
