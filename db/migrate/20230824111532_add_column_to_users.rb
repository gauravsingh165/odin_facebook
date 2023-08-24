class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :string
    add_column :users, :education, :string
    add_column :users, :work, :string
    add_column :users, :intrest, :string
  end
end
