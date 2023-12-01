class UpdateForeignKeyForFinancialTransactions < ActiveRecord::Migration[7.1]
  def change
    # Remove the old foreign key
    remove_foreign_key :financial_transactions, column: :group_id
    # Rename the column from group_id to category_id
    rename_column :financial_transactions, :group_id, :category_id
    # Add the new foreign key
    add_foreign_key :financial_transactions, :categories, column: :category_id
  end
end
