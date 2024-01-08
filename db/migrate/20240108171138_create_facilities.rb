class CreateFacilities < ActiveRecord::Migration[5.1]
  def change
    create_table :facilities do |t|
      t.string :class
      t.string :title

      t.timestamps
    end
  end
end
