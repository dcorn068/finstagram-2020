class User < ActiveRecord::Base

  has_many :finstagram_posts
  has_many :comments
  has_many :likes

  validates_uniqueness_of :email, :username
  validates_presence_of :email, :avatar_url, :username, :password

end