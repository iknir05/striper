class AddSuperadmintoAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :is_superadmin, :boolean
  end
end
