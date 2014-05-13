class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.text :body
      t.text :excerpt
      t.text :thumbnail
      t.text :slug
      t.integer :user_id

      t.timestamps
    end
  end
end
