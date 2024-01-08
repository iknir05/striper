class RenameClasstoIconClass < ActiveRecord::Migration[5.1]
  def change
      change_table :facilities do |t|
      t.rename :class, :icon_class
    end
  end
end
