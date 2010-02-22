class CreateModels < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.belongs_to :author
      t.integer :views_count
      t.datetime :published_at
      t.timestamps
    end
    
    create_table :users do |t|
      t.string :username
    end
    
    create_table :comments do |t|
      t.text :body
      t.belongs_to :post
      t.belongs_to :user
      t.integer :likes_count
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
