class DropFinancialTransactionsTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :financial_transactions
  end

  def down
    # You can recreate the table here if you want to make this migration reversible.
  end
end
