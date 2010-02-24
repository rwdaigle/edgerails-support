class Post < ActiveRecord::Base
  
  has_many :comments
  belongs_to :author, :class_name => 'User'
  
  validates_presence_of :author
  
  scope :published, lambda { 
    where("posts.published_at IS NOT NULL AND posts.published_at <= ?", Time.zone.now)
  }
  scope :published_since, lambda { |ago|
    published.where("posts.published_at >= ?", ago)
  }
  
  scope :recent, published.order("posts.published_at DESC")
  scope :popular, order("posts.views_count DESC")
  scope :unpublished, lambda {
    where("posts.published_at IS NULL OR posts.published_at > ?", Time.zone.now)
  }
  
  # Ludacris
  scope :titled_luda, where(:title => 'Luda')
  
  class << self
    
    # Search the title and body fields for the given string.
    # Start with an empty scope and build on it for each attr
    def search(q)
      [:title, :body].inject(scoped) do |combined_scope, attr|
        combined_scope.where("posts.#{attr} LIKE ?", "%#{q}%")
      end
    end
  end
end