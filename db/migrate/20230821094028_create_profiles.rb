class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.integer :user_id

      t.timestamps
    end
  end
end
