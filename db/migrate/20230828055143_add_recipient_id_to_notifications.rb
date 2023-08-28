class AddRecipientIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :recipient_id, :integer
  end
end
