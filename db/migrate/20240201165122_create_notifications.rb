class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :is_read?
      t.string :status

      t.timestamps
    end
  end
end
