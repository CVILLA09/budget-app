class DropJoinTableCategoriesPurchases < ActiveRecord::Migration[7.1]
  def change
    drop_join_table :categories, :purchases
  end
end
