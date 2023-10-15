class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |t|
      t.references :diner, null: false, foreign_key: { to_table: :users }
      t.references :cooking, null: false, foreign_key: { to_table: :cooking_records }
      t.integer :egg_count, null: false
      t.integer :corn_count, null: false

      t.timestamps
    end
  end
end
