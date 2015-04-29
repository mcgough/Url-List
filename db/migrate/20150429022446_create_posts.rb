class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :posts, :users
  end
end
