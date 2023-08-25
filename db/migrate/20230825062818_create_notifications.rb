class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.text :message
      t.boolean :read_status

      t.timestamps
    end
  end
end
