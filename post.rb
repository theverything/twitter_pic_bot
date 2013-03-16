require './reddit.rb'
require './twitter.rb'

def post_cycle
  begin
    reddit = Reddit.new("earthporn", 1)
    tweet = Post.new(reddit)
    puts Time.now
    tweet.to_twitter
    puts tweet.the_post
    sleep 3600
    post_cycle
  rescue
    puts "Duplicate... I'll try again in an hour"
    sleep 3600
    post_cycle
  end
  
end

post_cycle


