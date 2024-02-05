class RenameIsSuperadminToIsadminapproved < ActiveRecord::Migration[5.1]
  def change
    rename_column :admins, :is_superadmin, :is_admin_approved
  end
end
