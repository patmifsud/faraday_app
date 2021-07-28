class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.integer :feed_id
      t.text :post_type
      t.text :content

      t.text :provider_name
      t.text :author_name
      t.text :author_url
      
      t.timestamps
    end
  end
end
