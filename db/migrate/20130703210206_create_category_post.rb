class CreateCategoryPost < ActiveRecord::Migration
  def change
    create_table :categories_posts, id: false do |t|
      t.belongs_to :post
      t.belongs_to :category
    end
  end

end
