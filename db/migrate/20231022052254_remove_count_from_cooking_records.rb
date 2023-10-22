class RemoveCountFromCookingRecords < ActiveRecord::Migration[7.1]
  def change
    remove_column :cooking_records, :egg_count, :integer
    remove_column :cooking_records, :corn_count, :integer
  end
end
