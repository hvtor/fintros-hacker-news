require 'rubygems'
require 'httparty'

class ArticleCache
	attr_accessor :id, :title, :url
	@@cache = nil

	def initialize(id, title, url)
		@id = id
		@title = title
		@url = url
	end

	def self.refresh
		response = HTTParty.get(article_index_url)
    article_ids = response.parsed_response
    @@cache = article_ids.map do |id| 
    	article_url = article_base_url + "#{id}.json"
    	article = HTTParty.get(article_url).parsed_response	
    	self.new(id, article["title"], article["url"])
    end	
	end

	def self.retrieve count=30, start_at_id=0
		refresh unless @@cache
		@@cache.slice(start_at_id, count)
	end

private 
	def self.article_base_url
		"https://hacker-news.firebaseio.com/v0/item/"
	end

	def self.article_index_url
		"https://hacker-news.firebaseio.com/v0/topstories.json"
	end
end