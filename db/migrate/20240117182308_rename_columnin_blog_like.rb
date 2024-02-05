class RenameColumninBlogLike < ActiveRecord::Migration[5.1]
  def change
    rename_column :blog_likes, :users_id, :user_id
    rename_column :blog_likes, :blogs_id, :blog_id
  end
end
