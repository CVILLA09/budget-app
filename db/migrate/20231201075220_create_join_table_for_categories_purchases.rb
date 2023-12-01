class CreateJoinTableForCategoriesPurchases < ActiveRecord::Migration[7.1]
  def change
    create_join_table :categories, :purchases do |t|
      # If you want to add additional columns, you can do it here.
      t.index :category_id
      t.index :purchase_id
    end
  end
end
