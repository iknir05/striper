class AddColumnToMenu < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :menu_header, :boolean
    add_column :menus, :menu_footer, :boolean
  end
end
