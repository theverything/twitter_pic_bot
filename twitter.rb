require 'twitter'
require './twitter_keys.rb'

class Post

  include TwitterKeys

  def initialize(reddit)
    Twitter.configure do |config|
      config.consumer_key = KEY
      config.consumer_secret = SECRET
      config.oauth_token = TOKEN
      config.oauth_token_secret = TOKEN_SECRET
    end
    @reddit = reddit
  end

  def to_twitter
    Twitter.update(the_post)
  end

  def the_post
    post_build = []
    post_build << @reddit.get_title
    post_build << @reddit.get_url
    post_build << "#earthporn"
    post_build.join(" ")
  end

end
