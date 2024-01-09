class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.attachment :news_image
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
