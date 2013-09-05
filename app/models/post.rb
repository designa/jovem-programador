class Post < ActiveRecord::Base
  attr_accessible :user_id, :title, :full_text, :category_ids, :image
  has_and_belongs_to_many :categories

  validates_presence_of :user_id, :title, :full_text, :categories
  has_attached_file :image, :styles => { :headline => "750x250#", :square => "200x200#", thumb: "60x60#"}, :default_url => "/images/:style/missing.png"

  belongs_to :user
end
