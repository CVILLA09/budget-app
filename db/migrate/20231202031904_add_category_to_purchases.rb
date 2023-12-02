class AddCategoryToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_reference :purchases, :category, null: false, foreign_key: true
  end
end
