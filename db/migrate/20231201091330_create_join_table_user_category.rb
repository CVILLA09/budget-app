class CreateJoinTableUserCategory < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :categories do |t|
      # The create_join_table method already creates the category_id and user_id columns.
      t.index :user_id
      t.index :category_id
    end
  end
end
