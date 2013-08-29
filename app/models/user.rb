class User < ActiveRecord::Base
  attr_accessible :active, :email, :facebook, :name, :password, :twitter
  has_many :posts
end
