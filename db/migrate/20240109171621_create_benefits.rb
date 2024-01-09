class CreateBenefits < ActiveRecord::Migration[5.1]
  def change
    create_table :benefits do |t|
      t.string :icon_class
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
