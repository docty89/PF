class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :price
      t.string :image_id
      t.string :name
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
