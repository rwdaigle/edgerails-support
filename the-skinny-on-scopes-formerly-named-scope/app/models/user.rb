class User < ActiveRecord::Base

  has_many :posts, :foreign_key => :author_id
  has_many :comments
  
  validates_presence_of :username
  
  scope :published, lambda {
    joins("join posts on posts.author_id = users.id").
    where(Post.published.where_values).
    group("users.id")
  }
  
  scope :commented, joins("join comments on comments.user_id = users.id").group("users.id")
end