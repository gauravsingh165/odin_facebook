class AddColumnUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sender_id, :bigint
    add_column :users, :recipient_id, :bigint
  end
end
