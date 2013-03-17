God.watch do |w|
  w.name = "tweet_bot"
  w.start = "ruby /Users/theverything/ruby/twitter_pic_bot/daemon_post.rb"
  w.keepalive
end

