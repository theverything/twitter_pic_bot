require 'net/http'
require 'json'

class Reddit
  def initialize(subreddit, post_num)
    uri = URI("http://www.reddit.com/r/#{subreddit}.json")
    json = Net::HTTP.get(uri)
    page = JSON.parse(json)
    @post = page["data"]["children"][post_num - 1]["data"]
  end

  def get_title
    @post["title"]
  end

  def get_up_votes
    @post["score"]
  end

  def get_permalink
    "http://www.reddit.com" + @post["permalink"]
  end

  def get_url
    @post["url"]    
  end
end
