class CreateFriendshipRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friendship_requests do |t|
      t.bigint :sender_id
      t.bigint :recipient_id
      t.string :status

      t.timestamps
    end

    add_index :friendship_requests, :sender_id
    add_index :friendship_requests, :recipient_id
  end
end
