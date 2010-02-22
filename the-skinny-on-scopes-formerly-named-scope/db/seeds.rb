# Users
%w{ryan john tim dave}.each { |n| User.create!(:username => n)}

# Posts
{2.weeks.ago => '2 weeks ago', 1.week.ago => '1 week ago', Time.zone.now => 'Now', 1.week.from_now => '1 week from now'}.each do |published_at, title|
  Post.create!(:title => title, :body => title, :published_at => published_at, :author => User.all.rand, :views_count => rand(100))
end

# Comments
Post.all.each do |post|
  5.times do
    user = User.all.rand
    post.comments.create(:body => "#{user.username} commented", :user => user, :likes_count => rand(10))
  end
end