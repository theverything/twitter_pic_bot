require './reddit.rb'
require './twitter.rb'

def post_cycle
  begin
    reddit = Reddit.new("earthporn", 1)
    tweet = Post.new(reddit)
    tweet.to_twitter
    logger tweet.the_post
    sleep 3600
    post_cycle
  rescue
    logger "Duplicate... I'll try again in an hour"
    sleep 3600
    post_cycle
  end
  
end

def logger(message)
  File.open("./log.txt", 'a+') do |file|
    file.write("#{Time.now}\n")
    file.write("#{message}\n")
  end
end

post_cycle


