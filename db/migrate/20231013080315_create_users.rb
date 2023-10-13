class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :egg_count
      t.integer :corn_count

      t.timestamps
    end
  end
end
