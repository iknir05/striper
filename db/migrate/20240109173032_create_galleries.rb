class CreateGalleries < ActiveRecord::Migration[5.1]
  def change
    create_table :galleries do |t|
      t.attachment :gallery_image

      t.timestamps
    end
  end
end
