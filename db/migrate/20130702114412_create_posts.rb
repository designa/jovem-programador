class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :full_text
      t.belongs_to :user

      t.timestamps
    end
  end
end
