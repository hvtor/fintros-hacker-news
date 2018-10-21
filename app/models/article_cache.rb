require 'rubygems'
require 'httparty'

class ArticleCache
	attr_accessor :id, :title, :url
	@@cache = nil

	def initialize(id,title, url)
		@id = id
		@title = title
		@url = url
	end

	def self.refresh_index
		response = HTTParty.get(article_index_url)
    article_ids = response.parsed_response
    @@cache = article_ids.map do |id| 
    	[id, nil]
    end.to_h	
	end

	def self.fetch_article id 
		return @@cache[id] if @@cache[id]
		article_url = article_base_url + "#{id}.json"
  	article = HTTParty.get(article_url).parsed_response	
  	@@cache[id] = self.new(id, article["title"], article["url"])
	end

	def self.retrieve count=30, start_at_id=0
		refresh_index unless @@cache
		article_ids = @@cache.keys.slice(start_at_id, count)
		article_ids.map { |id| self.fetch_article id }
	end

private 
	def self.article_base_url
		"https://hacker-news.firebaseio.com/v0/item/"
	end

	def self.article_index_url
		"https://hacker-news.firebaseio.com/v0/topstories.json"
	end
end