class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.attachment :review_image
      t.string :full_name
      t.string :country
      t.text :description

      t.timestamps
    end
  end
end
