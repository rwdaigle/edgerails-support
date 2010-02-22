class Post < ActiveRecord::Base
  
  has_many :comments
  belongs_to :author, :class_name => 'User'
  
  validates_presence_of :author
  
  scope :published_since, lambda { |ago|
    published.where(["posts.published_at >= ?", ago])
  }
  scope :published, lambda { 
    where(["posts.published_at IS NOT NULL AND posts.published_at <= ?", Time.zone.now])
  }
  scope :popular, order("posts.views_count DESC")
  scope :unpublished, where("posts.published_at IS NULL")
  
  class << self
    
    def search(q)
      [:title, :body].inject(scoped) do |combined_scope, attr|
        combined_scope.where(["posts.#{attr} LIKE ?", "%#{sanitize_sql(q)}%"])
      end
    end
  end
end

# Show create/new/build on scope
# Show using class method to build named scope