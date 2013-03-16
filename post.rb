require './reddit.rb'
require './twitter.rb'
require './logger.rb'

def post_cycle
  begin
    reddit = Reddit.new("earthporn", 1)
    tweet = Post.new(reddit)
    tweet.to_twitter
    Logger.write tweet.the_post
    sleep 900
  rescue
    Logger.write "Duplicate... I'll try again in 15 mins"
    sleep 900
  end
end


loop do
  post_cycle
end
