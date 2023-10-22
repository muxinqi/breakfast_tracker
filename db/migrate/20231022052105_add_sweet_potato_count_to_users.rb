class AddSweetPotatoCountToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :sweet_potato_count, :integer, null: false, default: 0
  end
end
