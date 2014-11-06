class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :messages
  has_many :votes
end
