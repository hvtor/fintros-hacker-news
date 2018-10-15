require 'rubygems'
require 'httparty'

class Article
	include HTTParty	
	base_uri 'https://hacker-news.firebaseio.com/v0/'
	
	def initialize(service, page)
		@options = {query: {site: service, page: page }}
	end

	def articles
		self.class.get('/items.json')
	end
		HN_articles = Article.new("hacker-news", 1).articles
		puts HN_articles
end

