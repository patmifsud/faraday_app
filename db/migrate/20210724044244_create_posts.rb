class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.integer :feed_id
      t.text :source
      t.text :content

      t.timestamps
    end
  end
end
