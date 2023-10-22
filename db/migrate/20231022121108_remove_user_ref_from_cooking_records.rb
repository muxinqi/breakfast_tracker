class RemoveUserRefFromCookingRecords < ActiveRecord::Migration[7.1]
  def change
    remove_reference :cooking_records, :operator, null: false, foreign_key: { to_table: :users }
    remove_reference :cooking_records, :terminator, foreign_key: { to_table: :users }
  end
end
