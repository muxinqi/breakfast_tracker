class CreateCookingRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :cooking_records do |t|
      t.references :operator, null: false, foreign_key: true
      t.references :terminator, foreign_key: true
      t.datetime :finished_at
      t.integer :egg_count
      t.integer :corn_count

      t.timestamps
    end
  end
end
