class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.date :publish_date
      t.string :author
      t.attachment :image

      t.timestamps
    end
  end
end
