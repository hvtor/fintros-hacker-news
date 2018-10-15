require "httparty"

class ArticlesController < ApplicationController
  def index
  	setup_links
    load_article_responses    
  end

  def load_thirty_articles
    
  end
  
  def setup_links
    @url = 'https://hacker-news.firebaseio.com/v0/item/'
    @response = HTTParty.get('https://hacker-news.firebaseio.com/v0/topstories.json')
    @article_ids = @response.parsed_response
    @article_urls = []
    @article_ids.each do |id|
      @article_url = @url + "#{id}.json"
      @article_urls << @article_url
    end
  end

  def load_article_responses
    @article_responses = []
    @article_urls.slice(0,30).each do |article|
      @article_response = HTTParty.get(article).parsed_response
      @article_responses << @article_response
    end
  end
end