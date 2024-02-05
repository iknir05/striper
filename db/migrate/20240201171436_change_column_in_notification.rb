class ChangeColumnInNotification < ActiveRecord::Migration[5.1]
  def change
    change_column :notifications , :is_read? , :boolean
  end
end
