class CreateCookingRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :cooking_records do |t|
      t.references :operator, null: false, foreign_key: { to_table: :users }
      t.references :terminator, null: true, foreign_key: { to_table: :users }
      t.datetime :finished_at, null: true
      t.integer :egg_count, null: false
      t.integer :corn_count, null: false

      t.timestamps
    end
  end
end
