class Post < ActiveRecord::Base
  attr_accessible :user_id, :title, :full_text, :category_ids
  has_and_belongs_to_many :categories

  validates_presence_of :user_id, :title, :full_text, :categories

  belongs_to :user
end
