class Keyword < ActiveRecord::Base
	def grab_twitts
	     client = Twitter::REST::Client.new do |config|
	     config.consumer_key = ENV["TWITTER_CONSUMER_KEY"] #real app has .env file with the actual key
	     config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
	     config.oauth_token = ENV["TWITTER_OAUTH_TOKEN"]
	     config.oauth_token_secret = ENV["TWITTER_OAUTH_SECRET"]
	    end

	    client.search(self.word, result_type: "recent").take(3).collect do |tweet|
			"#{tweet.user.screen_name}: #{tweet.text}"
		end

	end
end