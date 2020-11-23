class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :schools, :name, unique: true
  end
end
