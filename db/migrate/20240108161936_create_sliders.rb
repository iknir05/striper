class CreateSliders < ActiveRecord::Migration[5.1]
  def change
    create_table :sliders do |t|
      t.attachment :slider_image
      t.string :title
      t.string :description
      t.string :button_title
      t.string :button_url

      t.timestamps
    end
  end
end
