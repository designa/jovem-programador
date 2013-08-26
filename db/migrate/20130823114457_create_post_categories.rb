class CreatePostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
      t.string :name
      t.string :slug
      t.string :color

      t.timestamps
    end
  end
end
