class Category < ActiveRecord::Base
  attr_accessible :color, :name, :description, :slug
  has_and_belongs_to_many :posts

  validates_presence_of :name
  validates_uniqueness_of :slug

  def to_s
    name
  end
end
