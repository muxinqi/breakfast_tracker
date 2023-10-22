class AddSweetPotatoCountToMeals < ActiveRecord::Migration[7.1]
  def change
    add_column :meals, :sweet_potato_count, :integer, null: false, default: 0
  end
end
