class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user, index: true
      t.references :votable,polymorphic:true, index: true

      t.timestamps null: false
    end
    add_foreign_key :votes, :users
    add_foreign_key :votes, :votables
  end
end
