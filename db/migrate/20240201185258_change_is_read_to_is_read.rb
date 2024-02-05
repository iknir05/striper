class ChangeIsReadToIsRead < ActiveRecord::Migration[5.1]
  def change
    rename_column :notifications, :is_read?, :is_read
  end
end
