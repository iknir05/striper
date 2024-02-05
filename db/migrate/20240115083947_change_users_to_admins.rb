class ChangeUsersToAdmins < ActiveRecord::Migration[5.1]
  def change
        rename_table :users, :admins
  end
end
