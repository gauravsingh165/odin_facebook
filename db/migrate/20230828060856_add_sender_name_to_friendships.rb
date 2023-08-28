class AddSenderNameToFriendships < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :sender_name, :string
  end
end
