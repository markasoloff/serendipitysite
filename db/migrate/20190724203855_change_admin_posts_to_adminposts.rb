class ChangeAdminPostsToAdminposts < ActiveRecord::Migration[5.2]
  def change
    rename_table :admin_posts, :adminposts
  end
end
