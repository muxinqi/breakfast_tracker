class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :egg_count, null: false
      t.integer :corn_count, null: false

      t.timestamps
    end
  end
end
