rclass CreateBlogLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_likes do |t|
      t.string :status
      t.references :users, foreign_key: true
      t.references :blogs, foreign_key: true

      t.timestamps
    end
  end
end
