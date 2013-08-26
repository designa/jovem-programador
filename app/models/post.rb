class Post < ActiveRecord::Base
  attr_accessible :content, :title, :author, :post_category_ids
  has_and_belongs_to_many :post_categories
end
