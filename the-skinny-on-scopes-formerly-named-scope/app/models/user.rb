class User < ActiveRecord::Base

  has_many :posts, :foreign_key => :author_id
  has_many :comments
  
  validates_presence_of :username
  
  scope :published, lambda {
    joins(:posts).
    where(Post.published.where_values).
    group("users.id")
  }
  
  scope :commented, joins(:comments).group("users.id")
end