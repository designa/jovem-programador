class PostCategory < ActiveRecord::Base
  attr_accessible :name, :slug, :color
  validates_presence_of :name, :slug, :color
  validates_uniqueness_of :name, :slug, :color

  has_and_belongs_to_many :posts
end
